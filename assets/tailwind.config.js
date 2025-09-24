/**
 *
 * Needed to include the plugin-generated CSS, safelist, etc in the final bundle
 * when running `mix tailwind metro`
 *
 */
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./css/**/*.css",
    "./js/**/*.js",
    "../lib/mbta_metro.ex",
    "../lib/mbta_metro/**/*.*ex",
    "../../../config/*.*exs",
    "../../mbta_metro/lib/**/*.ex",
  ],
  presets: [require("./js/tailwind-preset")],
};
