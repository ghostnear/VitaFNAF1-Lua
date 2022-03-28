Input = {
    controls = nil,
    lastcontrols = nil
}

-- Checks if current key is pressed
function Input:check(key)
    if self.controls ~= nil then
        return Controls.check(self.controls, key)
    end
    return false
end

-- Checks if key has just been pressed
function Input:checkPressed(key)
    if self.controls ~= nil and self.lastcontrols ~= nil then
        return (Controls.check(self.controls, key) and not Controls.check(self.lastcontrols, key))
    end
    return false
end

-- Checks if key has just been released
function Input:checkReleased(key)
    if self.controls ~= nil and self.lastcontrols ~= nil then
        return (not Controls.check(self.controls, key) and Controls.check(self.lastcontrols, key))
    end
    return false
end

-- Updates the input
function Input:update()
    self.lastcontrols = self.controls
    self.controls = Controls.read()
end