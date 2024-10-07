const plugin = require("tailwindcss/plugin")

const {colors, content, plugins, safelist} = require("mbta_metro")

const fallbackFontFamily = ['ui-sans-serif', 'system-ui','sans-serif','"Apple Color Emoji"','"Segoe UI Emoji"','"Segoe UI Symbol"','"Noto Color Emoji"'];

module.exports = {
  content: [
    ...content,
    "../lib/doc_components.ex",
    "../lib/mbta_metro/**/*.ex",
    "../storybook/**/*.exs",
  ],
  safelist: [
    ...safelist,
  ],
  important: ".mbta-metro-web",
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
  ],
  theme: {
    fontFamily: {
      base: ["Inter", '"Helvetica Neue"', 'Helvetica', 'Arial', ...fallbackFontFamily],
      heading: ['"Helvetica Neue"', 'Helvetica', 'Arial', ...fallbackFontFamily],
      inter: ["Inter", ...fallbackFontFamily],
      helvetica: ['"Helvetica Neue"', 'Helvetica', ...fallbackFontFamily]
    },
    extend: {
      colors: {
        ...colors
      }
    },
  },
}
