import colors from "./colors"

const colorKeys = Object.keys(colors);
const backgroundColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`bg-${color}`, "g"),
    variants: ["hover"]
  }
});
const textColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`text-${color}`, "g"),
    variants: ["hover"]
  }
});
const ringColors = colorKeys.map(color => {
  return `ring-${color}`;
});

export default [
  ...colorKeys,
  ...backgroundColors,
  ...ringColors,
  ...textColors
]
