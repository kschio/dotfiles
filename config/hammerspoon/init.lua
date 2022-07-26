local ShiftItKeys = require "Util/ShiftItKeys"
hyper = {"⌘", "⌥", "⌃"}
mash = {"⌥", "⌃"}

local spoons = {
    ConfigReloader = true,
    AppLauncher = true,
    WindowManagement = false
}

for spoonName, enabled in pairs(spoons) do
    if enabled then
        hs.loadSpoon(spoonName)
        spoon[spoonName].start(spoon[spoonName])
        spoon[spoonName].bindHotkeys(spoon[spoonName])
        spoon[spoonName].bindMouseEvents(spoon[spoonName])
    end
end

hs.hotkey.bind(hyper, "end", function() hs.caffeinate.lockScreen(); end)

-- Spoons
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys(ShiftItKeys)

hs.alert("Hammerspoon config loaded 🤘")
