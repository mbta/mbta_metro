var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __esm = (fn, res) => function __init() {
  return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
};
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// js/tokens.js
var tokens_exports = {};
__export(tokens_exports, {
  default: () => tokens_default
});
var tokens_default;
var init_tokens = __esm({
  "js/tokens.js"() {
    tokens_default = {
      "colors": {
        "charcoal": {
          "10": "var(--colors-charcoal-10)",
          "20": "var(--colors-charcoal-20)",
          "30": "var(--colors-charcoal-30)",
          "40": "var(--colors-charcoal-40)",
          "50": "var(--colors-charcoal-50)",
          "60": "var(--colors-charcoal-60)",
          "70": "var(--colors-charcoal-70)",
          "80": "var(--colors-charcoal-80)",
          "90": "var(--colors-charcoal-90)"
        },
        "cobalt": {
          "10": "var(--colors-cobalt-10)",
          "20": "var(--colors-cobalt-20)",
          "30": "var(--colors-cobalt-30)",
          "40": "var(--colors-cobalt-40)",
          "50": "var(--colors-cobalt-50)",
          "60": "var(--colors-cobalt-60)",
          "70": "var(--colors-cobalt-70)",
          "80": "var(--colors-cobalt-80)",
          "90": "var(--colors-cobalt-90)"
        },
        "gold": {
          "10": "var(--colors-gold-10)",
          "20": "var(--colors-gold-20)",
          "30": "var(--colors-gold-30)",
          "40": "var(--colors-gold-40)",
          "50": "var(--colors-gold-50)",
          "60": "var(--colors-gold-60)",
          "70": "var(--colors-gold-70)",
          "80": "var(--colors-gold-80)",
          "90": "var(--colors-gold-90)"
        },
        "firebrick": {
          "10": "var(--colors-firebrick-10)",
          "20": "var(--colors-firebrick-20)",
          "30": "var(--colors-firebrick-30)",
          "40": "var(--colors-firebrick-40)",
          "50": "var(--colors-firebrick-50)",
          "60": "var(--colors-firebrick-60)",
          "70": "var(--colors-firebrick-70)",
          "80": "var(--colors-firebrick-80)",
          "90": "var(--colors-firebrick-90)"
        },
        "emerald": {
          "10": "var(--colors-emerald-10)",
          "20": "var(--colors-emerald-20)",
          "30": "var(--colors-emerald-30)",
          "40": "var(--colors-emerald-40)",
          "50": "var(--colors-emerald-50)",
          "60": "var(--colors-emerald-60)",
          "70": "var(--colors-emerald-70)",
          "80": "var(--colors-emerald-80)",
          "90": "var(--colors-emerald-90)"
        },
        "amethyst": {
          "10": "var(--colors-amethyst-10)",
          "20": "var(--colors-amethyst-20)",
          "30": "var(--colors-amethyst-30)",
          "40": "var(--colors-amethyst-40)",
          "50": "var(--colors-amethyst-50)",
          "60": "var(--colors-amethyst-60)",
          "70": "var(--colors-amethyst-70)",
          "80": "var(--colors-amethyst-80)",
          "90": "var(--colors-amethyst-90)"
        },
        "white": "var(--colors-white)",
        "black": "var(--colors-black)",
        "subway": "var(--colors-subway)",
        "green-line": "var(--colors-green-line)",
        "orange-line": "var(--colors-orange-line)",
        "red-line": "var(--colors-red-line)",
        "blue-line": "var(--colors-blue-line)",
        "silver-line": "var(--colors-silver-line)",
        "brand-bus": "var(--colors-brand-bus)",
        "ferry": "var(--colors-ferry)",
        "the-ride": "var(--colors-the-ride)",
        "commuter-rail": "var(--colors-commuter-rail)",
        "swa": "var(--colors-swa)",
        "mbta-dark": "var(--colors-mbta-dark)",
        "dark-winter": "var(--colors-dark-winter)",
        "mid-winter": "var(--colors-mid-winter)"
      },
      "borderRadius": {
        "DEFAULT": "var(--border-radius-default)",
        "none": "var(--border-radius-none)",
        "xs": "var(--border-radius-xs)",
        "sm": "var(--border-radius-sm)",
        "md": "var(--border-radius-md)",
        "lg": "var(--border-radius-lg)",
        "xl": "var(--border-radius-xl)",
        "2xl": "var(--border-radius-2xl)",
        "4xl": "var(--border-radius-4xl)",
        "full": "var(--border-radius-full)"
      },
      "borderWidth": {
        "DEFAULT": "var(--border-width-default)",
        "xs": "var(--border-width-xs)",
        "sm": "var(--border-width-sm)",
        "md": "var(--border-width-md)",
        "lg": "var(--border-width-lg)"
      },
      "spacing": {
        "0": "var(--spacing-0)",
        "1": "var(--spacing-1)",
        "2": "var(--spacing-2)",
        "3": "var(--spacing-3)",
        "4": "var(--spacing-4)",
        "5": "var(--spacing-5)",
        "6": "var(--spacing-6)",
        "8": "var(--spacing-8)",
        "10": "var(--spacing-10)",
        "12": "var(--spacing-12)",
        "16": "var(--spacing-16)",
        "20": "var(--spacing-20)",
        "DEFAULT": "var(--spacing-default)",
        "xs": "var(--spacing-xs)",
        "sm": "var(--spacing-sm)",
        "md": "var(--spacing-md)",
        "lg": "var(--spacing-lg)",
        "xl": "var(--spacing-xl)",
        "2xl": "var(--spacing-2xl)"
      },
      "lineHeight": {
        "DEFAULT": "var(--line-height-default)",
        "sm": "var(--line-height-sm)",
        "md": "var(--line-height-md)",
        "lg": "var(--line-height-lg)",
        "xl": "var(--line-height-xl)",
        "2xl": "var(--line-height-2xl)"
      },
      "transitionDuration": "var(--transition-duration)",
      "fontSize": {
        "DEFAULT": "var(--font-size-default)",
        "sm": "var(--font-size-sm)",
        "md": "var(--font-size-md)",
        "lg": "var(--font-size-lg)",
        "xl": "var(--font-size-xl)",
        "2xl": "var(--font-size-2xl)"
      },
      "fontFamily": {
        "base": "var(--font-family-base)",
        "heading": "var(--font-family-heading)",
        "inter": "var(--font-family-inter)",
        "helvetica": "var(--font-family-helvetica)"
      },
      "minimumTapTargetSize": "var(--minimum-tap-target-size)"
    };
  }
});

// node_modules/tailwindcss/lib/util/createPlugin.js
var require_createPlugin = __commonJS({
  "node_modules/tailwindcss/lib/util/createPlugin.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", {
      value: true
    });
    Object.defineProperty(exports, "default", {
      enumerable: true,
      get: function() {
        return _default;
      }
    });
    function createPlugin(plugin2, config) {
      return {
        handler: plugin2,
        config
      };
    }
    createPlugin.withOptions = function(pluginFunction, configFunction = () => ({})) {
      const optionsFunction = function(options) {
        return {
          __options: options,
          handler: pluginFunction(options),
          config: configFunction(options)
        };
      };
      optionsFunction.__isOptionsFunction = true;
      optionsFunction.__pluginFunction = pluginFunction;
      optionsFunction.__configFunction = configFunction;
      return optionsFunction;
    };
    var _default = createPlugin;
  }
});

// node_modules/tailwindcss/lib/public/create-plugin.js
var require_create_plugin = __commonJS({
  "node_modules/tailwindcss/lib/public/create-plugin.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", {
      value: true
    });
    Object.defineProperty(exports, "default", {
      enumerable: true,
      get: function() {
        return _default;
      }
    });
    var _createPlugin = /* @__PURE__ */ _interop_require_default(require_createPlugin());
    function _interop_require_default(obj) {
      return obj && obj.__esModule ? obj : {
        default: obj
      };
    }
    var _default = _createPlugin.default;
  }
});

// node_modules/tailwindcss/plugin.js
var require_plugin = __commonJS({
  "node_modules/tailwindcss/plugin.js"(exports, module) {
    var createPlugin = require_create_plugin();
    module.exports = (createPlugin.__esModule ? createPlugin : { default: createPlugin }).default;
  }
});

// js/tailwind-preset.js
init_tokens();

// js/styles/safelist.js
var { default: theme } = (init_tokens(), __toCommonJS(tokens_exports));
var colorKeys = Object.keys(theme.colors);
var backgroundColors = colorKeys.map((color) => {
  return {
    pattern: new RegExp(`bg-${color}`, "g"),
    variants: ["hover"]
  };
});
var borderColors = colorKeys.map((color) => {
  return {
    pattern: new RegExp(`border-${color}`, "g"),
    variants: ["after", "before", "hover"]
  };
});
var fillColors = colorKeys.map((color) => {
  return {
    pattern: new RegExp(`fill-${color}`, "g"),
    variants: ["hover"]
  };
});
var ringColors = colorKeys.map((color) => {
  return {
    pattern: new RegExp(`ring-${color}`, "g"),
    variants: ["hover"]
  };
});
var textColors = colorKeys.map((color) => {
  return {
    pattern: new RegExp(`text-${color}`, "g"),
    variants: ["hover"]
  };
});
var zindexes = [...Array(5).keys()].map((n) => {
  return `z-${n * 10}`;
});
var safelist_default = [
  ...colorKeys,
  ...backgroundColors,
  ...borderColors,
  ...fillColors,
  ...ringColors,
  ...textColors,
  ...zindexes
];

// js/plugins/button.js
var import_plugin = __toESM(require_plugin());
var buttonPlugin = (0, import_plugin.default)(({ addBase, addComponents, theme: theme2 }) => {
  addBase({
    "button.mbta-button": {
      alignItems: "center",
      borderRadius: theme2("borderRadius.md"),
      borderWidth: theme2("borderWidth.sm"),
      columnGap: theme2("spacing.sm"),
      display: "inline-flex",
      fontFamily: theme2("fontFamily.base"),
      fontWeight: theme2("fontWeight.medium"),
      paddingBottom: theme2("spacing.sm"),
      paddingTop: theme2("spacing.sm"),
      paddingLeft: theme2("spacing.md"),
      paddingRight: theme2("spacing.md"),
      transition: `all ${theme2("transitionDuration.DEFAULT")} ease`,
      "&[aria-disabled]": {
        backgroundColor: theme2("colors.charcoal.30"),
        borderColor: theme2("colors.charcoal.30"),
        color: theme2("colors.white"),
        cursor: "not-allowed"
      },
      "&:focus, &:focus-within": {
        outline: `${theme2("spacing.xs")} solid ${theme2("colors.cobalt.60")}`,
        outlineOffset: 0
      }
    }
  }), addComponents({
    ".mbta-button-primary": {
      backgroundColor: "var(--button-primary-default-background-color)",
      borderColor: "var(--button-primary-default-border-color)",
      color: "var(--button-primary-default-text-color)",
      "&:hover, &:active": {
        backgroundColor: "var(--button-primary-active-background-color)",
        borderColor: "var(--button-primary-active-border-color)",
        color: "var(--button-primary-active-text-color)"
      }
    },
    ".mbta-button-secondary": {
      backgroundColor: "var(--button-secondary-default-background-color)",
      borderColor: "var(--button-secondary-default-border-color)",
      color: "var(--button-secondary-default-text-color)",
      "&:hover": {
        backgroundColor: "var(--button-secondary-hover-background-color)",
        borderColor: "var(--button-secondary-hover-border-color)",
        color: "var(--button-secondary-hover-text-color)"
      },
      "&:active": {
        backgroundColor: "var(--button-secondary-active-background-color)",
        borderColor: "var(--button-secondary-active-border-color)",
        color: "var(--button-secondary-active-text-color)"
      }
    }
  });
});
var button_default = buttonPlugin;

// js/styles/plugins.js
var plugins_default = [button_default];

// js/tailwind-preset.js
var tailwind_preset_default = {
  content: ["../lib/mbta_metro.ex", "../lib/mbta_metro/**/*.*ex"],
  plugins: [...plugins_default],
  safelist: [...safelist_default],
  theme: {
    extend: tokens_exports
  }
};
export {
  tailwind_preset_default as default
};
