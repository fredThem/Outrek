process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

// IMPORTANT this is to enable scss hotreload - requires to run webpack-dev-server
  // const chokidar = require("chokidar");
  // environment.config.devServer.before = (app, server) => {
  //   chokidar
  //     .watch([
  //       "config/locales/**/*.yml",
  //       "app/views/**/*.html.erb",
  //       "app/assets/**/*.scss",
  //     ])
  //     .on("change", () => server.sockWrite(server.sockets, "content-changed"));
  // }