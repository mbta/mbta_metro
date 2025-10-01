/**
 *
 * Needed to include the plugin-generated CSS, safelist, etc in the final bundle
 * when running `mix tailwind metro`
 *
 * `important` is needed here for the generated utilities to override the consumer application's Tailwind utilities
 *
 */
/** @type {import('tailwindcss').Config} */
export default {
  content: ["../lib/mbta_metro.ex", "../lib/mbta_metro/**/*.*ex"],
  plugins: [require("@tailwindcss/forms")],
  presets: [require("./js/tailwind-preset")],
};
