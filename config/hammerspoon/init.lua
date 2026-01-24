-- WarpMouse - horizontal mouse warping for vertical screen arrangements
WarpMouse = hs.loadSpoon("WarpMouse")
WarpMouse.margin = 8
WarpMouse:start()

-- PaperWM - scrolling tiling window manager
PaperWM = hs.loadSpoon("PaperWM")

-- config
hs.window.animationDuration = 0

-- fully permissive filter
PaperWM.window_filter = hs.window.filter.new(true)

PaperWM.window_gap = 8
PaperWM.window_ratios = { 0.3, 0.5, 0.7 }
PaperWM.swipe_fingers = 3
PaperWM.drag_window = { "alt", "ctrl" }
PaperWM.lift_window = { "alt", "ctrl", "shift" }

PaperWM:bindHotkeys({
  -- Focus (arrows)
  focus_left  = {{"alt", "ctrl"}, "left"},
  focus_right = {{"alt", "ctrl"}, "right"},
  focus_up    = {{"alt", "ctrl"}, "up"},
  focus_down  = {{"alt", "ctrl"}, "down"},

  -- Focus (vim-style)
  focus_prev = {{"alt", "ctrl"}, "k"},
  focus_next = {{"alt", "ctrl"}, "j"},

  -- Swap
  swap_left  = {{"alt", "ctrl", "shift"}, "left"},
  swap_right = {{"alt", "ctrl", "shift"}, "right"},
  swap_up    = {{"alt", "ctrl", "shift"}, "up"},
  swap_down  = {{"alt", "ctrl", "shift"}, "down"},

  -- Resize
  center_window = {{"alt", "ctrl"}, "c"},
  full_width    = {{"alt", "ctrl"}, "f"},
  cycle_width   = {{"alt", "ctrl"}, "r"},
  increase_width = {{"alt", "ctrl"}, "l"},
  decrease_width = {{"alt", "ctrl"}, "h"},

  -- Slurp/barf (vertical columns)
  slurp_in = {{"alt", "ctrl"}, "i"},
  barf_out = {{"alt", "ctrl"}, "o"},

  -- Floating
  toggle_floating = {{"alt", "ctrl"}, "."},
  focus_floating  = {{"alt", "ctrl"}, "space"},

  -- Jump to window by number
  focus_window_1 = {{"alt", "ctrl"}, "1"},
  focus_window_2 = {{"alt", "ctrl"}, "2"},
  focus_window_3 = {{"alt", "ctrl"}, "3"},
  focus_window_4 = {{"alt", "ctrl"}, "4"},
  focus_window_5 = {{"alt", "ctrl"}, "5"},

  -- Refresh
  refresh_windows = {{"alt", "ctrl", "shift"}, "t"},
})

PaperWM:start()

-- FocusMode - dim unfocused windows
FocusMode = hs.loadSpoon("FocusMode")
FocusMode.dimAlpha = 0.4
FocusMode.mouseDim = true
FocusMode.autoBindDefaultHotkeys = false
hs.hotkey.bind({"alt", "ctrl"}, "/", function()
  FocusMode:toggle()
end)

hs.alert.show("Hammerspoon loaded")

-- Reload config
hs.hotkey.bind({"alt", "ctrl", "shift"}, "r", function()
  hs.reload()
end)
