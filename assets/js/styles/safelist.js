import colors from "./colors"

const colorKeys = Object.keys(colors);

const backgroundColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`bg-${color}`, "g"),
    variants: ["hover"]
  }
});

const ringColors = colorKeys.map(color => {
  return `ring-${color}`;
});

const textColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`text-${color}`, "g"),
    variants: ["hover"]
  }
});

const zindexes = [...Array(5).keys()].map(n => {
  return `z-${n * 10}`;
});

export default [
  ...colorKeys,
  ...backgroundColors,
  ...ringColors,
  ...textColors,
  ...zindexes
]
