-- WarpMouse - horizontal mouse warping for vertical screen arrangements
WarpMouse = hs.loadSpoon("WarpMouse")
WarpMouse.margin = 8
WarpMouse:start()

-- PaperWM - scrolling tiling window manager
PaperWM = hs.loadSpoon("PaperWM")

PaperWM:bindHotkeys({
  -- Focus
  focus_left  = {{"alt", "cmd"}, "left"},
  focus_right = {{"alt", "cmd"}, "right"},
  focus_up    = {{"alt", "cmd"}, "up"},
  focus_down  = {{"alt", "cmd"}, "down"},

  -- Swap
  swap_left  = {{"alt", "cmd", "shift"}, "left"},
  swap_right = {{"alt", "cmd", "shift"}, "right"},
  swap_up    = {{"alt", "cmd", "shift"}, "up"},
  swap_down  = {{"alt", "cmd", "shift"}, "down"},

  -- Resize
  center_window = {{"alt", "cmd"}, "c"},
  full_width    = {{"alt", "cmd"}, "f"},
  cycle_width   = {{"alt", "cmd"}, "r"},
  increase_width = {{"alt", "cmd"}, "l"},
  decrease_width = {{"alt", "cmd"}, "h"},

  -- Slurp/barf (nested columns)
  slurp_in = {{"alt", "cmd"}, "i"},
  barf_out = {{"alt", "cmd"}, "o"},

  -- Floating
  toggle_floating = {{"alt", "cmd", "shift"}, "escape"},

  -- Switch spaces
  switch_space_l = {{"alt", "cmd"}, ","},
  switch_space_r = {{"alt", "cmd"}, "."},
  switch_space_1 = {{"alt", "cmd"}, "1"},
  switch_space_2 = {{"alt", "cmd"}, "2"},
  switch_space_3 = {{"alt", "cmd"}, "3"},
  switch_space_4 = {{"alt", "cmd"}, "4"},
  switch_space_5 = {{"alt", "cmd"}, "5"},

  -- Move window to space
  move_window_1 = {{"alt", "cmd", "shift"}, "1"},
  move_window_2 = {{"alt", "cmd", "shift"}, "2"},
  move_window_3 = {{"alt", "cmd", "shift"}, "3"},
  move_window_4 = {{"alt", "cmd", "shift"}, "4"},
  move_window_5 = {{"alt", "cmd", "shift"}, "5"},
})

PaperWM:start()

-- Reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.alert.show("PaperWM loaded")
