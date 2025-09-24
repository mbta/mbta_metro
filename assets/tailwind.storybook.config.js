/**
 *
 * Consumes the Metro Tailwind preset in order to have the right styles and
 * utility classes when running `mix tailwind storybook`
 *
 */
/** @type {import('tailwindcss').Config} */
export default {
  content: ["../**/*.story.exs"],
  important: ".mbta-metro-web",
  presets: [require("./js/tailwind-preset")],
};
