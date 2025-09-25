import basePlugin from "../plugins/base";
import buttonPlugin from "../plugins/button";

export default function () {
  return [require("@tailwindcss/forms"), basePlugin, buttonPlugin];
}
