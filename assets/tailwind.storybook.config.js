/**
 *
 * Consumes the Metro Tailwind preset in order to have the right styles and
 * utility classes when running `mix tailwind storybook`
 *
 */
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
  presets: [require("./js/tailwind-preset")],
};
