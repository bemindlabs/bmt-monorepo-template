# Kiro QA Testing

AI-powered test generation and quality assurance automation using Kiro's intelligent workflow system.

## Kiro QA Capabilities

| Feature              | Description                                 |
| -------------------- | ------------------------------------------- |
| Smart Generation     | Context-aware test generation using Kiro AI |
| Workflow Integration | Seamless integration with Kiro workflows    |
| Multi-Agent System   | Specialized agents for different test types |
| Repository Analysis  | Deep understanding of monorepo structure    |

## Kiro Test Generation

Generate comprehensive test suites using Kiro's intelligent analysis and multi-agent system.

### Usage with Kiro

Simply ask Kiro to generate tests for your code:

```
Generate tests for packages/core/src/auth
Create unit tests for apps/web/src/components/Button.tsx
Add integration tests for the payment flow
```

### Kiro Workflow Integration

Kiro automatically:

- Analyzes your monorepo structure
- Understands TypeScript configurations
- Follows project coding standards
- Integrates with existing test setup
- Respects Turborepo build pipeline

### Examples

```
# Generate tests for entire domain
"Generate comprehensive tests for apps/core-services/service-core/src/domain"

# Generate tests for single file
"Create unit tests for packages/shared/src/http-client.ts"

# Generate tests for application layer
"Add integration tests for apps/web/src/features/auth"
```

### Multi-Agent System

| Agent               | Specialization                            |
| ------------------- | ----------------------------------------- |
| Test Architect      | Complex test design, property-based tests |
| Unit Generator      | Fast unit test generation                 |
| Property Generator  | fast-check property tests                 |
| Coverage Optimizer  | Coverage gap analysis                     |
| Quality Reviewer    | Fast quality validation                   |
| Integration Analyst | Integration test scenarios                |

### Strategy Selection

| Strategy   | Description            | Use Case                  |
| ---------- | ---------------------- | ------------------------- |
| `fast`     | Fastest generation     | Quick coverage            |
| `balanced` | Mix of approaches      | General use (recommended) |
| `quality`  | Best for complex logic | Critical paths            |

### Output Files

```
src/__tests__/[name].spec.ts           # Unit tests
src/__tests__/[name].integration.spec.ts  # Integration tests
src/__tests__/[name].property.spec.ts     # Property-based tests
```

## /qa-local

Run Zero-QA multi-agent test generation locally.

### Usage

```bash
/qa-local [options]
```

### Options

- `--path <path>` - Target path
- `--strategy <name>` - Generation strategy
- `--coverage <percent>` - Target coverage

## /qa-zero

Run Zero QA automated validation pipeline.

### Usage

```bash
/qa-zero
```

### Pipeline Steps

1. **Discovery** - Find testable files
2. **Analysis** - Analyze code complexity
3. **Generation** - Generate test cases
4. **Validation** - Run tests
5. **Coverage** - Check coverage metrics
6. **Report** - Generate report

## Test Generation Process

### Step 1: Discover Files

```bash
find $TARGET -name "*.ts" \
  -not -name "*.spec.ts" \
  -not -name "*.test.ts" \
  -not -name "*.d.ts" \
  -not -path "*/node_modules/*" \
  -not -path "*/dist/*"
```

### Step 2: Analyze Code

- Identify testable units
- Determine complexity
- Find dependencies
- Map integration points

### Step 3: Generate Tests

For each file:

1. Test Architect designs strategy
2. Unit Generator creates unit tests
3. Integration Analyst creates integration tests
4. Property Generator adds property tests

### Step 4: Verify

```bash
pnpm test --passWithNoTests
pnpm test --coverage
```

## Test File Structure

```typescript
import { describe, it, expect, vi } from 'vitest';
import { MyFunction } from '../my-module';

describe('MyFunction', () => {
  describe('basic functionality', () => {
    it('should handle valid input', () => {
      const result = MyFunction('valid');
      expect(result).toBe('expected');
    });

    it('should handle edge cases', () => {
      expect(MyFunction('')).toBe('default');
      expect(MyFunction(null)).toThrow();
    });
  });

  describe('error handling', () => {
    it('should throw on invalid input', () => {
      expect(() => MyFunction('invalid')).toThrow('Error message');
    });
  });
});
```

## Property-Based Testing

Using fast-check for property tests:

```typescript
import { fc } from '@fast-check/vitest';

describe('MyFunction properties', () => {
  it('should be idempotent', () => {
    fc.assert(
      fc.property(fc.string(), (input) => {
        const first = MyFunction(input);
        const second = MyFunction(first);
        return first === second;
      })
    );
  });
});
```

## Coverage Targets

| Metric             | Target |
| ------------------ | ------ |
| Line Coverage      | 80%    |
| Branch Coverage    | 75%    |
| Function Coverage  | 90%    |
| Statement Coverage | 80%    |

## Integration with CI

```yaml
# .github/workflows/test.yml
- name: Run Tests
  run: pnpm test --coverage

- name: Check Coverage
  run: |
    coverage=$(cat coverage/coverage-summary.json | jq '.total.lines.pct')
    if [ "$coverage" -lt 80 ]; then
      echo "Coverage below 80%"
      exit 1
    fi
```

## Best Practices

1. **Test behavior, not implementation**
2. **Use descriptive test names**
3. **Follow AAA pattern** (Arrange, Act, Assert)
4. **Mock external dependencies**
5. **Keep tests fast and isolated**
6. **Test edge cases and error paths**
