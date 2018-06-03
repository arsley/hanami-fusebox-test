const path = require('path');
const publicPath = path.resolve(__dirname, '..', '..', 'public');

const { FuseBox, CSSPlugin, SassPlugin } = require('fuse-box');
const fuse = FuseBox.init({
  homeDir : 'frontend',
  target  : 'browser@es6',
  output  : `${publicPath}/$name.js`,
  plugins : [
    [SassPlugin(), CSSPlugin()]
  ],
  shim : {
    jquery : {
      source  : 'node_modules/jquery/dist/jquery.min.js',
      exports : '$'
    }
  }
});
fuse.bundle('app').instructions('> application.ts').watch('frontend/**');
fuse.run();
