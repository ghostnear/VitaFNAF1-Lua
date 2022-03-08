-- Loading screen, loads all assets and saves them in the AssetManager class
local menuState = State:extend()
menuState.assetManager = nil
menuState.stateManager = nil

-- Constructor
function menuState:init(stateM)
    -- Asset manager is carried from loading, no need to init it
    self.stateManager = stateM
end

return menuState