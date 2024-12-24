const MbtaRiderDesignSystemConfig = require("@mbta/rider-design-system");
const { colors } = MbtaRiderDesignSystemConfig;
const colorKeys = Object.keys(colors);

const backgroundColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`bg-${color}`, "g"),
    variants: ["hover"]
  }
});

const borderColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`border-${color}`, "g"),
    variants: ["after", "before", "hover"]
  }
});

const fillColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`fill-${color}`, "g"),
    variants: ["hover"]
  }
});

const ringColors = colorKeys.map(color => {
  return {
    pattern: new RegExp(`ring-${color}`, "g"),
    variants: ["hover"]
  }
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
  ...borderColors,
  ...fillColors,
  ...ringColors,
  ...textColors,
  ...zindexes
]
