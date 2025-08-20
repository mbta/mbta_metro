const theme = require("./../priv/design-system/tokens.base");
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
  ],
  theme: {
    extend: theme
  }
}
