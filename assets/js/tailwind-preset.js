/**
 *
 * Custom preset to use in other Tailwind-based applications. Includes Metro's
 * plugins, theme, and a safelist with all the color utility classes.
 * https://v3.tailwindcss.com/docs/presets
 *
 */
import * as theme from "./tokens";
import safelist from "./styles/safelist";
import plugins from "./styles/plugins";

/** @type {import('tailwindcss').Config} */
export default {
  content: ["../lib/mbta_metro.ex", "../lib/mbta_metro/**/*.*ex"],
  plugins: [...plugins],
  safelist: [...safelist],
  theme: {
    extend: theme,
  },
};
