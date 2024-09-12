// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration


const fs = require("fs")
const path = require("path")
const plugin = require("tailwindcss/plugin")

const {colors, content, plugins} = require("mbta_metro")

module.exports = {
  content: [
    ...content,
    "./js/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        ...colors,
      }
    },
  },
  plugins: [
    ...plugins,
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),
  ]
}
