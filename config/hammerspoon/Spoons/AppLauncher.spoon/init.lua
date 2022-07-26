local BaseSpoon = require "Util/BaseSpoon"
local obj = BaseSpoon.new()
local mash = {"⌘", "⌥", "⌃"}

obj.name = "AppLauncher"
obj.version = "1.0"

function obj:start()
    hs.hotkey.bind(mash, "c", function() hs.application.launchOrFocus("Google Chrome") end)
    hs.hotkey.bind(mash, "e", function() hs.application.launchOrFocus("Visual Studio Code") end)
    hs.hotkey.bind(mash, "f", function() hs.application.launchOrFocus("Finder") end)
    hs.hotkey.bind(mash, "m", function() hs.application.launchOrFocus("Mimestream") end)
    hs.hotkey.bind(mash, "p", function() hs.application.launchOrFocus("System Preferences") end)
    hs.hotkey.bind(mash, "s", function() hs.application.launchOrFocus("Spotify") end)
    hs.hotkey.bind(mash, "t", function() hs.application.launchOrFocus("iTerm") end)
    hs.hotkey.bind(mash, "z", function() hs.application.launchOrFocus("Kaleidoscope") end)
    hs.hotkey.bind(mash, "g", function () hs.urlevent.openURL("https://mail.google.com") end)
end

return obj
