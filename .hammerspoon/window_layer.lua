----------------------------------------
-- WINDOW MODE (a modal key layer for Rectangle)
----------------------------------------

local windowMode = hs.hotkey.modal.new()

-- Enter Window Mode when Hyper + W is pressed
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "w", function()
    windowMode:enter()
    hs.alert.show("Window Mode")
end)

-- Exit Window Mode when Escape is pressed
windowMode:bind({}, "escape", function()
    windowMode:exit()
end)

-- Helper to open Rectangle URL and exit mode
local function rectangleAction(action)
    hs.urlevent.openURL("rectangle://execute-action?name=" .. action)
    windowMode:exit()
end

-----------------------------------------------------
-- h = Left Half
-----------------------------------------------------
windowMode:bind({}, "h", function()
    rectangleAction("left-half")
end)

-----------------------------------------------------
-- l = Right Half
-----------------------------------------------------
windowMode:bind({}, "l", function()
    rectangleAction("right-half")
end)

-----------------------------------------------------
-- k = Top Half
-----------------------------------------------------
windowMode:bind({}, "k", function()
    rectangleAction("top-half")
end)

-----------------------------------------------------
-- j = Bottom Half
-----------------------------------------------------
windowMode:bind({}, "j", function()
    rectangleAction("bottom-half")
end)

-----------------------------------------------------
-- Space = Almost Maximize
-----------------------------------------------------
windowMode:bind({}, "space", function()
    rectangleAction("almost-maximize")
end)

-----------------------------------------------------
-- Enter = Maximize
-----------------------------------------------------
windowMode:bind({}, "return", function()
    rectangleAction("maximize")
end)

return windowMode

