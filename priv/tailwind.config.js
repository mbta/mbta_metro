const plugin = require("tailwindcss/plugin");
const defaultTheme = require('tailwindcss/defaultTheme');
const MbtaRiderDesignSystemConfig = require("@mbta/rider-design-system");
const { content, plugins, safelist } = require("./js/index")

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
    ...plugins(),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({ addVariant }) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({ addVariant }) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),
  ],
  theme: { 
    ...MbtaRiderDesignSystemConfig.theme,
    spacing: Object.assign({ ...defaultTheme.spacing }, { ...MbtaRiderDesignSystemConfig.theme.spacing })
  }
}
