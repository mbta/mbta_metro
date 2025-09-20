/**
 * Custom preset to use in other Tailwind-based applications.
 * https://v3.tailwindcss.com/docs/presets
 */
const { theme } = require("./../../priv/design-system/tokens.base");

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "../../deps/mbta_metro/lib/mbta_metro/components/*.ex",
    "../../deps/mbta_metro/lib/mbta_metro/live/*.ex",
  ],
  plugins: [require("@tailwindcss/forms")],
  theme,
};
