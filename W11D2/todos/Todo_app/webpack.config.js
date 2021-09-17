const path = require('path'); //It's a module available to use from Node with methods that help us deal and interact with file and directory path names on the machine’s filesystem.

module.exports = {
  entry: './frontend/todo_redux.jsx', // specifies where webpack will start looking. With react, we will now have a frontend directory and an entry file.
  output: { //where webpack should output the bundled files
    path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
    // use path.resolve() to resolve our paths into an absolute path.
    // __dirname tells us the absolute path of the directory containing the currently executing file
    filename: 'bundle.js'
  },
  devtool: 'source-map',  // A source map makes it possible for you to see the line numbers of your original source code when errors are raised. This is generally not possible because your bundle.js does not maintain the line numbers from the files it is bundling.
  resolve: { //accepts a resolve key, which lets you specify what file extensions to process without explicitly naming them when we import export. You must include the star matcher '*' to be able to include files with an explicit extension.
    extensions: ['.js', '.jsx', '*']
  },
  module: {//allows you to specify several loaders within our webpack configuration. This is a concise way to display loaders, and helps to maintain clean code.

    //loader is the part of an operating system that is responsible for loading programs and libraries
      rules: [
        { //we are saying here that for any jsx files we use babel loader
          test: /\.jsx?$/, //a regular expression that tests what kind of files to run through this loader.
          exclude: /(node_modules)/, //ignore these files
          use: {
            loader: 'babel-loader', //the name of the loader we are going to use (babel-loader).
            options: { // options for the loader
              // for webpack 5, this 'query' key should be 'options' key instead
              // for more info: https://webpack.js.org/configuration/module/#ruleoptions--rulequery

              presets: ['@babel/env', '@babel/react'] //tells loader to use @babel/env which transpiles back to es5 and @babel/react which converts jsx code
            }
          },
        }
      ]
    },

};