const { default: safelist } = require("./js/styles/safelist");

module.exports = {
  presets: [require("./js/tailwind-preset")],
  important: ".mbta-metro-web",
  safelist,
};
