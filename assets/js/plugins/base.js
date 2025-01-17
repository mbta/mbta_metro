import plugin from "tailwindcss/plugin";

/**
 * Basic styles, CSS resets, etc. for improving cross-browser consistency for
 * the MBTA Metro components
 */
const basePlugin = plugin(({ addBase, theme }) =>
  addBase({
    // remove default caret in Safari
    "details > summary::-webkit-details-marker": {
      display: "none"
    },
    // the styles from the @tailwindcss/forms plugin aren't customizable, (see
    // https://github.com/tailwindlabs/tailwindcss/discussions/4645 for
    // discussion on custom ring color), yet are also too specific and can
    // override other classes... so we override them as suggested by
    // https://github.com/tailwindlabs/tailwindcss/discussions/4649#discussioncomment-8714473
    // to more easily achieve our desired custom focus styles
    "[type='checkbox'], [type='radio']": {
      "border-color": theme("colors.cobalt.30"),
      color: theme("colors.cobalt.30")
    },
    "[type='checkbox']:focus, [type='radio']:focus": {
      "--tw-ring-color": theme("colors.cobalt.60"),
      "--tw-ring-offset-color": "transparent",
      "--tw-ring-offset-width": "0px",
      "border-color": theme("colors.cobalt.30")
    }
  })
);

export default basePlugin;
