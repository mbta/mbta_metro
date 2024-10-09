const fallbackFontFamily = ['ui-sans-serif', 'system-ui','sans-serif','"Apple Color Emoji"','"Segoe UI Emoji"','"Segoe UI Symbol"','"Noto Color Emoji"'];

export default {
  "base": ["Inter", '"Helvetica Neue"', 'Helvetica', 'Arial', ...fallbackFontFamily],
  "heading": ['"Helvetica Neue"', 'Helvetica', 'Arial', ...fallbackFontFamily],
  "inter": ["Inter", ...fallbackFontFamily],
  "helvetica": ['"Helvetica Neue"', 'Helvetica', ...fallbackFontFamily]
}
