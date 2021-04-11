import fs from 'fs';
import path from 'path';

const shim = fs.readFileSync(
 path.resolve(
    'node_modules',
    'mutationobserver-shim',
    'dist',
    'mutationobserver.min.js'
  ),
  { encoding: 'utf-8' }
);
const script = window.document.createElement('script');
script.textContent = shim;

window.document.body.appendChild(script);

window.ResizeObserver = window.ResizeObserver ||
  jest.fn().mockImplementation(() => ({
    disconnect: jest.fn(),
    observe: jest.fn(),
    unobserve: jest.fn(),
  }));
