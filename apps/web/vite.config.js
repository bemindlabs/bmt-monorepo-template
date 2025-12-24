import react from '@vitejs/plugin-react';
import process from 'node:process';
import { dirname, resolve } from 'path';
import { fileURLToPath } from 'url';
import { defineConfig } from 'vite';

const __dirname = dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
    },
  },
  server: {
    port: 3000,
    open: process.env.DOCKER !== 'true',
    host: true,
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
  },
});
