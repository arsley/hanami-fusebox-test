const path = require('path');
const publicPath = path.resolve(__dirname, '..', '..', 'public');

const { FuseBox } = require('fuse-box');
const fuse = FuseBox.init({
  homeDir : 'frontend',
  target  : 'browser@es6',
  output  : `${publicPath}/$name.js`,
  useTypescriptCompiler: true,
  plugins : [
  ],
  shim : {
  }
});
fuse.bundle('react-app').instructions('> application.js').watch('frontend/**');
fuse.run();
