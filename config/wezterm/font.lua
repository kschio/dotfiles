local wezterm = require 'wezterm'

local font_size = 14
local bold = true

local options = {}
if bold then
   options['weight'] = 'Bold'
end

local font = wezterm.font('MonoLisa', options)

return {
   font      = font,
   font_size = font_size,
   line_height = 1.1
}
