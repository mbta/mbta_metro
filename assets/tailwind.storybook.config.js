const { default: safelist } = require("./js/styles/safelist");
module.exports = {
  content: [
    "./../storybook/**/*.exs",
    "./../lib/mbta_metro/components/*.ex",
    "./../lib/mbta_metro/live/*.ex",
  ],
  presets: [require("./js/tailwind-preset")],
  important: ".mbta-metro-web",
  safelist,
};
