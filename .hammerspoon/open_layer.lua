----------------------------------------
-- OPEN MODE (a modal key layer)
----------------------------------------

local openMode = hs.hotkey.modal.new()

-- Enter Open Mode when Hyper + O is pressed
-- Hyper = cmd + alt + ctrl + shift (Raycast Hyper)
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "o", function()
    openMode:enter()
    hs.alert.show("Open Mode")
end)

-- Exit Open Mode when Escape is pressed
openMode:bind({}, "escape", function()
    openMode:exit()
end)

-----------------------------------------------------
-- Inside Open Mode: Hyper + I → Open Ghostty
-----------------------------------------------------

openMode:bind({}, "i", function()
    hs.application.launchOrFocus("Ghostty")
    openMode:exit()
end)


-----------------------------------------------------
-- Inside Open Mode: Hyper + B → Open Google Chrome
-----------------------------------------------------

openMode:bind({}, "b", function()
    hs.application.launchOrFocus("Google Chrome")
    openMode:exit()
end)

-----------------------------------------------------
-- Inside Open Mode: Hyper + C → Open Cursor
-----------------------------------------------------

openMode:bind({}, "c", function()
    hs.application.launchOrFocus("Cursor")
    openMode:exit()
end)

return openMode

