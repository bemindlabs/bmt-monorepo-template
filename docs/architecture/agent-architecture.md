# Agent Architecture

Design patterns and architecture for building AI agents.

## Agent Class Hierarchy

```mermaid
classDiagram
    class Agent {
        <<abstract>>
        +name: string
        +description: string
        +config: AgentConfig
        +execute(input: string): Promise~AgentResponse~
        #initialize(): Promise~void~
        #cleanup(): Promise~void~
    }

    class SimpleAgent {
        +provider: Provider
        +execute(input: string): Promise~AgentResponse~
    }

    class ToolAgent {
        +tools: Tool[]
        +execute(input: string): Promise~AgentResponse~
        +registerTool(tool: Tool): void
        -selectTool(input: string): Tool
    }

    class StatefulAgent {
        +state: AgentState
        +history: Message[]
        +execute(input: string): Promise~AgentResponse~
        +getHistory(): Message[]
        +clearHistory(): void
    }

    class OrchestrationAgent {
        +subAgents: Agent[]
        +execute(input: string): Promise~AgentResponse~
        +delegateTo(agent: Agent, input: string): Promise~AgentResponse~
    }

    Agent <|-- SimpleAgent
    Agent <|-- ToolAgent
    Agent <|-- StatefulAgent
    Agent <|-- OrchestrationAgent
    ToolAgent <|-- StatefulAgent
```

## Agent Execution Flow

```mermaid
sequenceDiagram
    participant User
    participant Agent
    participant Provider
    participant Tool
    participant API as AI API

    User->>Agent: execute(input)
    Agent->>Agent: initialize()
    Agent->>Provider: createCompletion(prompt)
    Provider->>API: POST /messages
    API-->>Provider: response

    alt Tool Call Required
        Provider-->>Agent: toolCall
        Agent->>Tool: execute(params)
        Tool-->>Agent: result
        Agent->>Provider: continueWithResult(result)
        Provider->>API: POST /messages
        API-->>Provider: finalResponse
    end

    Provider-->>Agent: response
    Agent->>Agent: cleanup()
    Agent-->>User: AgentResponse
```

## Provider Abstraction

```mermaid
graph TB
    subgraph "Agent Layer"
        AGENT[Agent]
    end

    subgraph "Provider Interface"
        INTERFACE["Provider Interface<br/>+ createCompletion()<br/>+ streamCompletion()<br/>+ countTokens()"]
    end

    subgraph "Implementations"
        CLAUDE[ClaudeProvider]
        OPENAI[OpenAIProvider]
        GEMINI[GeminiProvider]
        OLLAMA[OllamaProvider]
    end

    subgraph "APIs"
        CLAUDE_API[Claude API]
        OPENAI_API[OpenAI API]
        GEMINI_API[Gemini API]
        OLLAMA_API[Ollama Local]
    end

    AGENT --> INTERFACE
    INTERFACE --> CLAUDE
    INTERFACE --> OPENAI
    INTERFACE --> GEMINI
    INTERFACE --> OLLAMA
    CLAUDE --> CLAUDE_API
    OPENAI --> OPENAI_API
    GEMINI --> GEMINI_API
    OLLAMA --> OLLAMA_API
```

## Agent Patterns

### 1. Simple Agent Pattern

Single-turn completion without tools.

```typescript
class SimpleAgent extends Agent {
  async execute(input: string): Promise<AgentResponse> {
    const response = await this.provider.createCompletion({
      model: this.config.model,
      messages: [{ role: 'user', content: input }],
    });

    return {
      success: true,
      data: response.content,
    };
  }
}
```

```mermaid
graph LR
    A[Input] --> B[Agent]
    B --> C[Provider]
    C --> D[AI API]
    D --> E[Response]
```

### 2. Tool Agent Pattern

Agent that can use tools to complete tasks.

```typescript
class ToolAgent extends Agent {
  private tools: Map<string, Tool>;

  async execute(input: string): Promise<AgentResponse> {
    let response = await this.provider.createCompletion({
      messages: [{ role: 'user', content: input }],
      tools: this.getToolDefinitions(),
    });

    while (response.toolCalls?.length) {
      const results = await this.executeTools(response.toolCalls);
      response = await this.provider.continueWithResults(results);
    }

    return { success: true, data: response.content };
  }
}
```

```mermaid
graph TB
    A[Input] --> B[Agent]
    B --> C{Tool Call?}
    C -->|Yes| D[Execute Tool]
    D --> E[Tool Result]
    E --> B
    C -->|No| F[Response]
```

### 3. Stateful Agent Pattern

Agent that maintains conversation history.

```typescript
class StatefulAgent extends Agent {
  private history: Message[] = [];

  async execute(input: string): Promise<AgentResponse> {
    this.history.push({ role: 'user', content: input });

    const response = await this.provider.createCompletion({
      messages: this.history,
    });

    this.history.push({ role: 'assistant', content: response.content });

    return { success: true, data: response.content };
  }
}
```

### 4. Orchestration Pattern

Agent that coordinates multiple sub-agents.

```typescript
class OrchestrationAgent extends Agent {
  private subAgents: Map<string, Agent>;

  async execute(input: string): Promise<AgentResponse> {
    const plan = await this.createPlan(input);

    for (const step of plan.steps) {
      const agent = this.subAgents.get(step.agentName);
      const result = await agent.execute(step.input);
      // Process result...
    }

    return this.synthesizeResults();
  }
}
```

```mermaid
graph TB
    A[Input] --> B[Orchestrator]
    B --> C[Create Plan]
    C --> D[Agent 1]
    C --> E[Agent 2]
    C --> F[Agent 3]
    D --> G[Results]
    E --> G
    F --> G
    G --> H[Synthesize]
    H --> I[Response]
```

## State Management

```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Initializing: execute()
    Initializing --> Processing: initialized
    Processing --> WaitingForTool: toolCall
    WaitingForTool --> Processing: toolResult
    Processing --> Completing: done
    Completing --> Idle: response
    Processing --> Error: error
    WaitingForTool --> Error: error
    Error --> Idle: reset
```

## Error Handling

```mermaid
graph TB
    subgraph "Error Types"
        A[AgentError]
        B[ProviderError]
        C[ToolExecutionError]
        D[ValidationError]
        E[RateLimitError]
    end

    subgraph "Handling Strategy"
        F[Retry with Backoff]
        G[Fallback Provider]
        H[Graceful Degradation]
        I[Error Response]
    end

    B --> F
    E --> F
    F -->|Max Retries| G
    G -->|All Failed| H
    A --> I
    C --> I
    D --> I
```

## Best Practices

1. **Single Responsibility** - Each agent should do one thing well
2. **Dependency Injection** - Inject providers and tools for testability
3. **Immutable State** - Don't mutate shared state
4. **Error Boundaries** - Catch and handle errors at agent boundaries
5. **Logging** - Log all interactions for debugging
6. **Rate Limiting** - Respect API rate limits
7. **Cost Tracking** - Monitor token usage and costs

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
