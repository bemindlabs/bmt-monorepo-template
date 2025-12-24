import './App.css';

const VERSION = '0.1.1';

const features = [
  { icon: '🚀', iconLabel: 'Rocket', title: 'Turborepo', desc: 'High-performance build system' },
  { icon: '📦', iconLabel: 'Package', title: 'pnpm 9+', desc: 'Fast, disk space efficient' },
  { icon: '⚡', iconLabel: 'Lightning', title: 'Vite 6', desc: 'Next generation frontend tooling' },
  { icon: '⚛️', iconLabel: 'Atom', title: 'React 19', desc: 'Latest React with TypeScript' },
  { icon: '🤖', iconLabel: 'Robot', title: 'AI Agents', desc: 'Multi-provider AI support' },
  { icon: '🐳', iconLabel: 'Whale', title: 'Docker', desc: 'Containerized development' },
  { icon: '☸️', iconLabel: 'Helm', title: 'Kubernetes', desc: 'Production-ready K8s configs' },
  { icon: '🔥', iconLabel: 'Fire', title: 'Firebase', desc: 'Hosting & Firestore ready' },
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
    <main className="app">
      <header className="header">
        <div className="logo-container">
          <span className="logo-icon" role="img" aria-label="Package">
            📦
          </span>
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
            <article key={feature.title} className="feature-card">
              <span className="feature-icon" role="img" aria-label={feature.iconLabel}>
                {feature.icon}
              </span>
              <h3>{feature.title}</h3>
              <p>{feature.desc}</p>
            </article>
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
          aria-label="View GitHub Repository (opens in new tab)"
        >
          GitHub Repository
        </a>
        <a
          href="https://github.com/bemindlabs/bmt-monorepo-template/wiki"
          target="_blank"
          rel="noreferrer"
          className="link-button"
          aria-label="View Documentation (opens in new tab)"
        >
          Documentation
        </a>
      </section>

      <footer className="footer">
        <p>
          Developed by{' '}
          <a
            href="https://www.bemind.tech/"
            target="_blank"
            rel="noreferrer"
            aria-label="Visit BEMIND TECHNOLOGY website (opens in new tab)"
          >
            BEMIND TECHNOLOGY CO., LTD.
          </a>
        </p>
        <p className="copyright">MIT License</p>
      </footer>
    </main>
  );
}

export default App;
