import esbuild from 'esbuild';
import process from 'process';
import builtins from 'builtin-modules';

import * as fs from 'fs';
import * as path from 'path';

const IS_COMMON_JS = process.argv[2] === 'commonjs';
console.log(IS_COMMON_JS);
const IS_PRODUCTION = process.argv[2] === 'production' || process.argv[3] === 'production';
const banner = `/*
THIS IS A GENERATED/BUNDLED FILE BY ESBUILD
if you want to view the source, please visit the github repository https://github.com/Myriad-Dreamin/typst.ts/blob/main/packages/typst.ts
*/
`;

let wasmPlugin = {
  name: 'wasm',
  setup(build) {
    // Resolve ".wasm" files to a path with a namespace
    build.onResolve({ filter: /\.wasm$/ }, args => {
      if (args.resolveDir === '') {
        return; // Ignore unresolvable paths
      }
      let p = args.path;
      return {
        path: path.isAbsolute(p) ? p : path.join(args.resolveDir, p),
        namespace: 'wasm-binary',
      };
    });

    // Virtual modules in the "wasm-binary" namespace contain the
    // actual bytes of the WebAssembly file. This uses esbuild's
    // built-in "binary" loader instead of manually embedding the
    // binary data inside JavaScript code ourselves.
    build.onLoad({ filter: /.*/, namespace: 'wasm-binary' }, async args => {
      let contents = new Uint8Array();

      try {
        contents = await fs.promises.readFile(args.path);
      } catch (e) {
        if (args.importer.includes('contrib/')) {
          console.log('error while importing:', args, e);
        }
      }
      return {
        contents,
        loader: 'binary',
      };
    });
  },
};

const context = await esbuild.context({
  banner: {
    js: banner,
  },
  outdir: IS_COMMON_JS ? 'dist/cjs/contrib/hljs/' : 'dist/esm/contrib/hljs/',
  outExtension: {
    '.js': '.bundle.js',
  },
  entryPoints: [
    'src/contrib/hljs/typst-lite.mts',
    'src/contrib/hljs/typst.mts',
  ],
  bundle: true,
  format: IS_COMMON_JS ? 'cjs' : 'esm',
  tsconfig: IS_COMMON_JS ? 'tsconfig.cjs.json' : 'tsconfig.json',
  platform: 'browser',
  external: [...builtins],
  target: 'es2020',
  logLevel: 'info',
  sourcemap: IS_PRODUCTION ? false : 'inline',
  treeShaking: true,
  plugins: [wasmPlugin],
});

if (IS_PRODUCTION) {
  await context.rebuild();
  process.exit(0);
} else {
  await context.watch();
}