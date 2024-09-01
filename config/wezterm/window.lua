local path = require 'path'

local use_background_image = true

local padding = 0
local window_padding = {
   left = "1cell",
   right = "1cell",
   top = "1cell",
   bottom = "1cell",
}

local M = {
   window_decorations = "RESIZE",
   window_padding = window_padding,
   window_background_image_hsb = {
      brightness = 0.5
   },
   adjust_window_size_when_changing_font_size = false,
}

if use_background_image then
   M.window_background_image = path.config .. '/backgrounds/bg-blurred-darker.png'
end

return M
