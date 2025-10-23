/**
 *
 * Consumes the Metro Tailwind preset in order to have the right styles and
 * utility classes when running `mix tailwind storybook`
 *
 */

/* Merge the themes! */
const defaultTheme = require("tailwindcss/defaultTheme");
const metroTheme = require("./js/tokens");
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
export default {
  content: [
    "../lib/mbta_metro.ex",
    "../lib/mbta_metro/**/*.*ex",
    "../storybook/components/system_icons/*.story.exs",
    "../storybook/components/*.story.exs",
    "../storybook/live/*.story.exs",
    "../storybook/theme/*.story.exs",
    "../storybook/*.story.exs",
  ],
  important: ".mbta-metro-web",
  safelist: [
    {
      pattern:
        /(bg|border|fill|ring|text)-(charcoal|cobalt|gold|firebrick|emerald|amethyst|white|black|subway|green-line|orange-line|red-line|blue-line|silver-line|brand-bus|ferry|the-ride|commuter-rail|swa|mbta-dark|dark-winter|mid-winter)./,
      variants: ["after", "before", "hover", "focus"],
    },
    "z-50",
    "z-60",
    "z-70",
    "z-80",
    "z-90",
    "z-100",
  ],
  theme,
};
