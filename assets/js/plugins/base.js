import plugin from "tailwindcss/plugin";

/**
 * Basic styles, CSS resets, etc. for improving cross-browser consistency for
 * the MBTA Metro components
 */
const basePlugin = plugin(({ addBase }) =>
  addBase({
    // remove default caret in Safari
    "details > summary::-webkit-details-marker": {
      display: "none"
    }
  })
);

export default basePlugin;
