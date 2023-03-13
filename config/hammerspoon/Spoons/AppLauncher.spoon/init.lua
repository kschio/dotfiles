local BaseSpoon = require "Util/BaseSpoon"
local obj = BaseSpoon.new()
local mash = {"⌘", "⌥", "⌃"}

obj.name = "AppLauncher"
obj.version = "1.0"

function obj:start()
    hs.hotkey.bind(mash, "c", function() hs.application.launchOrFocus("Arc") end)
    hs.hotkey.bind(mash, "e", function() hs.application.launchOrFocus("Visual Studio Code") end)
    hs.hotkey.bind(mash, "f", function() hs.application.launchOrFocus("Finder") end)
    hs.hotkey.bind(mash, "m", function() hs.application.launchOrFocus("Mimestream") end)
    hs.hotkey.bind(mash, "s", function() hs.application.launchOrFocus("Spotify") end)
    hs.hotkey.bind(mash, "t", function() hs.application.launchOrFocus("Alacritty") end)
    hs.hotkey.bind(mash, "z", function() hs.application.launchOrFocus("Kaleidoscope") end)
    hs.hotkey.bind(mash, "g", function () hs.urlevent.openURL("https://mail.google.com") end)

    hs.hotkey.bind(mash, "1", function() hs.application.launchOrFocus("Alacritty") end)
    hs.hotkey.bind(mash, "2", function() hs.application.launchOrFocus("Arc") end)
    hs.hotkey.bind(mash, "3", function() hs.application.launchOrFocus("Visual Studio Code") end)
    hs.hotkey.bind(mash, "4", function() hs.application.launchOrFocus("Figma") end)
    hs.hotkey.bind(mash, "9", function() hs.application.launchOrFocus("Spotify") end)
end

return obj
