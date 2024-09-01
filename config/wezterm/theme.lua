local wezterm = require 'wezterm'

local sync_with_system = false

local dark_theme = ({
   'cyberdream', -- [1],
   'Oxocarbon Dark', -- [1],
})[2]

local light_theme = ({
   'Catppuccin Latte', -- [1]
})[1]

local function scheme_for_appearance(appearance)
   if appearance:find 'Dark' then
      return dark_theme
   end

   return light_theme
end

if sync_with_system then
   wezterm.on('window-config-reloaded', function(window)
      local overrides = window:get_config_overrides() or {}
      local appearance = window:get_appearance()
      local scheme = scheme_for_appearance(appearance)
      if overrides.color_scheme ~= scheme then
         overrides.color_scheme = scheme
         window:set_config_overrides(overrides)
      end
   end)
end

return {
   color_scheme = dark_theme
}
