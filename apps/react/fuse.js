const path = require('path');
const publicPath = path.resolve(__dirname, '..', '..', 'public');

const { FuseBox, CSSPlugin, SassPlugin } = require('fuse-box');
const fuse = FuseBox.init({
  homeDir : 'frontend',
  target  : 'browser@es6',
  output  : `${publicPath}/$name.js`,
  useTypescriptCompiler: true,
  plugins : [
    [SassPlugin(), CSSPlugin()]
  ],
  shim : {
  }
});
fuse.bundle('react-app').instructions('> application.js').watch('frontend/**');
fuse.run();
