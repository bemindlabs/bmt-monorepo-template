import './App.css';

const VERSION = '0.1.1';

const features = [
  { icon: '🚀', title: 'Turborepo', desc: 'High-performance build system' },
  { icon: '📦', title: 'pnpm 9+', desc: 'Fast, disk space efficient' },
  { icon: '⚡', title: 'Vite 6', desc: 'Next generation frontend tooling' },
  { icon: '⚛️', title: 'React 19', desc: 'Latest React with TypeScript' },
  { icon: '🤖', title: 'AI Agents', desc: 'Multi-provider AI support' },
  { icon: '🐳', title: 'Docker', desc: 'Containerized development' },
  { icon: '☸️', title: 'Kubernetes', desc: 'Production-ready K8s configs' },
  { icon: '🔥', title: 'Firebase', desc: 'Hosting & Firestore ready' },
];

const techStack = [
  'TypeScript 5.9+',
  'React 19',
  'Vite 6',
  'Turborepo',
  'pnpm 9+',
  'Vitest',
  'ESLint 9',
  'Prettier',
];

function App() {
  return (
    <div className="app">
      <header className="header">
        <div className="logo-container">
          <span className="logo-icon">📦</span>
          <h1>BMT Monorepo Template</h1>
        </div>
        <p className="tagline">
          Production-ready TypeScript monorepo with Turborepo, React 19, and AI agent support
        </p>
        <div className="version">v{VERSION}</div>
      </header>

      <section className="features">
        <h2>Features</h2>
        <div className="feature-grid">
          {features.map((feature) => (
            <div key={feature.title} className="feature-card">
              <span className="feature-icon">{feature.icon}</span>
              <h3>{feature.title}</h3>
              <p>{feature.desc}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="tech-stack">
        <h2>Tech Stack</h2>
        <div className="tech-tags">
          {techStack.map((tech) => (
            <span key={tech} className="tech-tag">
              {tech}
            </span>
          ))}
        </div>
      </section>

      <section className="quick-start">
        <h2>Quick Start</h2>
        <div className="code-block">
          <code>
            <span className="comment"># Clone and setup</span>
            <br />
            git clone https://github.com/bemindlabs/bmt-monorepo-template.git
            <br />
            cd bmt-monorepo-template
            <br />
            <br />
            <span className="comment"># Using Makefile</span>
            <br />
            make init
            <br />
            make dev
            <br />
            <br />
            <span className="comment"># Or using pnpm</span>
            <br />
            pnpm install
            <br />
            pnpm dev
          </code>
        </div>
      </section>

      <section className="links">
        <a
          href="https://github.com/bemindlabs/bmt-monorepo-template"
          target="_blank"
          rel="noreferrer"
          className="link-button primary"
        >
          GitHub Repository
        </a>
        <a
          href="https://github.com/bemindlabs/bmt-monorepo-template/wiki"
          target="_blank"
          rel="noreferrer"
          className="link-button"
        >
          Documentation
        </a>
      </section>

      <footer className="footer">
        <p>
          Developed by{' '}
          <a href="https://www.bemind.tech/" target="_blank" rel="noreferrer">
            BEMIND TECHNOLOGY CO., LTD.
          </a>
        </p>
        <p className="copyright">MIT License</p>
      </footer>
    </div>
  );
}

export default App;
