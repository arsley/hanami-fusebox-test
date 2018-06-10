const path = require('path');
const publicPath = path.resolve(__dirname, '..', '..', 'public');

const { FuseBox, BabelPlugin } = require('fuse-box');
const fuse = FuseBox.init({
  homeDir : 'frontend',
  target  : 'browser@es6',
  output  : `${publicPath}/$name.js`,
  useTypescriptCompiler: true,
  plugins : [
    BabelPlugin({
      presets : ["es2015"],
      plugins : [
        ["transform-react-jsx"]
      ]
    })
  ],
  shim : {
  }
});
fuse.bundle('react-app').instructions('> application.jsx').watch('frontend/**');
fuse.run();
