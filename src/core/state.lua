-- Create state class
State = class()
State.assetManager = nil
State.stateManager = nil

-- Default functions, should be overwritten by any inheritors
function State:init()
    self.assetManager = AssetManager:new()
end

function State:update(dt)

end

function State:draw()
    Graphics.debugPrint(5, 5, "This is an uninitialised state, you should not be seeing this.", Color.new(125, 0, 0))
end