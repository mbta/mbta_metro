/**
 *
 * Custom preset to use in other Tailwind-based applications. Includes Metro's
 * plugins, theme, and a safelist with all the color utility classes.
 * https://v3.tailwindcss.com/docs/presets
 *
 * Content will be overridden with the content from the actual config.
 *
 */

/* Merge the themes! */
const defaultTheme = require("tailwindcss/defaultTheme");
const metroTheme = require("./tokens");
const theme = deepMerge(defaultTheme, metroTheme);
theme.colors = metroTheme.colors;

function deepMerge(target, source) {
  for (const key in source) {
    if (source[key] instanceof Object && key in target) {
      target[key] = deepMerge(target[key], source[key]);
    } else {
      target[key] = source[key];
    }
  }
  return target;
}

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["../lib/mbta_metro.ex", "../lib/mbta_metro/**/*.*ex"],
  plugins: require("./styles/plugins"),
  presets: [],
  theme,
};
