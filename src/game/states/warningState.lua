-- Shows the warning
local warningState = State:extend()

-- Constructor
function warningState:init(stateM, assetM)
    -- Asset manager is carried from loading, no need to init it
    self.stateManager = stateM
    self.assetManager = assetM
end

function warningState:update(dt)

end

function warningState:draw()

end

return warningState