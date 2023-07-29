local wezterm = require 'wezterm';

return {
  color_scheme = "yo-berry",
  font = wezterm.font("MonoLisa Nerd Font", { weight="Medium", stretch="Normal", style="Normal" }),
  font_rules = {
    {
      italic = true,
      font = wezterm.font("MonoLisa Nerd Font", { weight="Medium", stretch="Normal", style="Italic" }),
    },
    {
      intensity = "Bold",
      font = wezterm.font("MonoLisa Nerd Font", { weight="Bold", stretch="Normal", style="Normal" }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("MonoLisa Nerd Font", { weight="Bold", stretch="Normal", style="Italic" })
    },
  },
  font_size = 14.0,
  line_height = 1.1,
  window_padding = {
    left = '1cell',
    right = '1cell',
    top = '1cell',
    bottom = '1cell',
  },
  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 0.9,
    brightness = 0.8,
  },
  window_background_opacity = 1.0,
  text_background_opacity = 1.0,
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  scrollback_lines = 6000,
  enable_scroll_bar = false,
  check_for_updates = false,
  default_cursor_style = "BlinkingBar",
  cursor_blink_rate = 500,
  front_end = 'WebGpu',
  max_fps = 120,
  audible_bell = 'Disabled'
}
