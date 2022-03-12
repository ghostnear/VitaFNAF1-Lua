-- Asset manager class (local so it can be instantiated)
local StateManager = class()
StateManager.stateQueue = nil

-- Main init function
function StateManager:init()
    self.stateQueue = Queue:new()
end

-- Main update function
function StateManager:update(dt)
    local containerPointer = self.stateQueue:getContainer()
    for i = self.stateQueue.front, self.stateQueue.back - 1, 1 do
        if containerPointer[i].update then
            containerPointer[i]:update(dt)
        end
    end
end

-- Main draw function
function StateManager:draw()
    local containerPointer = self.stateQueue:getContainer()
    for i = self.stateQueue.front, self.stateQueue.back - 1, 1 do
        if containerPointer[i].draw then
            containerPointer[i]:draw()
        end
    end
end

-- Main state handling functions
function StateManager:pushState(state)
    self.stateQueue:push(state)
end

function StateManager:popState()
    -- Clean state
    local front = self.stateQueue:getFront()
    if front.clean then
        front:clean()
    end

    -- Remove from queue
    self.stateQueue:pop()
end

function StateManager:clearStates()
    while self.stateQueue:length() ~= 0 do
        self:popState()
    end
end

-- Checks if there are any states left
function StateManager:canQuit()
    return (self.stateQueue:length() == 0)
end

return StateManager