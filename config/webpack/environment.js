const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    JQuery: "jquery",
    jquery: "jquery",
    "window.JQuery": "jquery"
  })
)

module.exports = environment
