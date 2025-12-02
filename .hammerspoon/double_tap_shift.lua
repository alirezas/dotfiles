----------------------------------------------------
-- Double-tap LEFT SHIFT to switch input source
----------------------------------------------------

local doubleTapTime = 0.30     -- max delay between taps (seconds)
local lastShiftTap = 0
local shiftWasDown = false

local function switchInputSource()
    local currentLayout = hs.keycodes.currentLayout()
    local layouts = hs.keycodes.layouts()
    
    for i, layout in ipairs(layouts) do
        if layout == currentLayout then
            local nextLayout = layouts[(i % #layouts) + 1]
            hs.keycodes.setLayout(nextLayout)
            hs.alert.show(nextLayout, 0.5)
            return
        end
    end
end

-- Watch left shift key events
local shiftTap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
    local flags = e:getFlags()
    local keyCode = e:getKeyCode()

    -- Left shift = 56, Right shift = 60
    local isLeftShiftDown = flags.shift and keyCode == 56

    if isLeftShiftDown and not shiftWasDown then
        local now = hs.timer.secondsSinceEpoch()

        if (now - lastShiftTap) < doubleTapTime then
            -- DOUBLE TAP DETECTED
            switchInputSource()
        end

        lastShiftTap = now
    end

    shiftWasDown = isLeftShiftDown
    return false
end)

shiftTap:start()

return shiftTap

