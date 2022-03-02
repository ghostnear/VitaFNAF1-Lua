-- Statemanager class (local as only one is required)
local StateManager = class()
StateManager.stateQueue = nil

-- Main init function
function StateManager:init()
    self.stateQueue = Queue:new()
end

-- Main update function
function StateManager:update(dt)

end

-- Main draw function
function StateManager:draw()
    local containerPointer = self.stateQueue:getContainer()
    for i = 0, self.stateQueue:length() - 1, 1 do
        containerPointer[i]:draw()
    end
end

-- Main state handling functions
function StateManager:pushState(state)
    self.stateQueue:push(state)
end

-- Clear the state queue
function StateManager:clearStates()
    self.stateQueue:clear()
end

-- Checks if there are any states left
function StateManager:canQuit()
    return (self.stateQueue:length() == 0)
end

return StateManager