----------------------------------------
-- RAYCAST MODE (a modal key layer for Raycast)
----------------------------------------

local raycastMode = hs.hotkey.modal.new()

-- Enter Raycast Mode when Hyper + R is pressed
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "r", function()
    raycastMode:enter()
    hs.alert.show("Raycast Mode")
end)

-- Exit Raycast Mode when Escape is pressed
raycastMode:bind({}, "escape", function()
    raycastMode:exit()
end)

-- Helper to open Raycast URL and exit mode
local function raycastAction(url)
    hs.urlevent.openURL(url)
    raycastMode:exit()
end

-----------------------------------------------------
-- h = Clipboard History
-----------------------------------------------------
raycastMode:bind({}, "h", function()
    raycastAction("raycast://extensions/raycast/clipboard-history/clipboard-history")
end)

-----------------------------------------------------
-- e = Empty Trash
-----------------------------------------------------
raycastMode:bind({}, "e", function()
    raycastAction("raycast://extensions/raycast/system/empty-trash")
end)

return raycastMode

