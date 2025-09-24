import plugin from "tailwindcss/plugin";

const buttonPlugin = plugin(({ addBase, addComponents, theme }) => {
  (addBase({
    "button.mbta-button": {
      alignItems: "center",
      borderRadius: theme("borderRadius.md"),
      borderWidth: theme("borderWidth.sm"),
      columnGap: theme("spacing.sm"),
      display: "inline-flex",
      fontFamily: theme("fontFamily.base"),
      fontWeight: theme("fontWeight.medium"),
      paddingBottom: theme("spacing.sm"),
      paddingTop: theme("spacing.sm"),
      paddingLeft: theme("spacing.md"),
      paddingRight: theme("spacing.md"),
      transition: `all ${theme("transitionDuration.DEFAULT")} ease`,
      "&[aria-disabled]": {
        backgroundColor: theme("colors.charcoal.30"),
        borderColor: theme("colors.charcoal.30"),
        color: theme("colors.white"),
        cursor: "not-allowed",
      },
      "&:focus, &:focus-within": {
        outline: `${theme("spacing.xs")} solid ${theme("colors.cobalt.60")}`,
        outlineOffset: 0,
      },
    },
  }),
    addComponents({
      ".mbta-button-primary": {
        backgroundColor: "var(--button-primary-default-background-color)",
        borderColor: "var(--button-primary-default-border-color)",
        color: "var(--button-primary-default-text-color)",
        "&:hover, &:active": {
          backgroundColor: "var(--button-primary-active-background-color)",
          borderColor: "var(--button-primary-active-border-color)",
          color: "var(--button-primary-active-text-color)",
        },
      },
      ".mbta-button-secondary": {
        backgroundColor: "var(--button-secondary-default-background-color)",
        borderColor: "var(--button-secondary-default-border-color)",
        color: "var(--button-secondary-default-text-color)",
        "&:hover": {
          backgroundColor: "var(--button-secondary-hover-background-color)",
          borderColor: "var(--button-secondary-hover-border-color)",
          color: "var(--button-secondary-hover-text-color)",
        },
        "&:active": {
          backgroundColor: "var(--button-secondary-active-background-color)",
          borderColor: "var(--button-secondary-active-border-color)",
          color: "var(--button-secondary-active-text-color)",
        },
      },
    }));
});
export default buttonPlugin;
