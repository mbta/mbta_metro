import tailwindConfig from "../tailwind.config";

// STYLES
import content from "./styles/content"
import plugins from "./styles/plugins"
import safelist from "./styles/safelist"

// HOOKS
import Map from "./hooks/map"
import DatePicker from "./hooks/date_picker"

const { theme: tailwindTheme } = tailwindConfig;

const Hooks = {
  DatePicker,
  Map
}

export {
  tailwindTheme,
  // STYLES
  content,
  plugins,
  safelist,
  // HOOKS
  Hooks,
  // INDIVIDUAL HOOKS
  DatePicker,
  Map
}
