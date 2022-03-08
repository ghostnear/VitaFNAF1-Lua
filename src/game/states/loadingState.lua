-- Loading screen, loads all assets and saves them in the AssetManager class
local loadingState = State:extend()
loadingState.assetManager = nil
loadingState.stateManager = nil
loadingState.loadList = nil
loadingState.loadSprite = nil

-- Constructor
function loadingState:init(stateM)
    -- Build asset manager
    self.assetManager = AssetManager:new()
    self.stateManager = stateM

    -- TODO: get this from an XML or something similar
    self.loadList = Queue:new()
    self.loadList:push({
        type = "image",
        name = "gui_icon_load",
        path = "assets/gui/loader.png"
    })

    -- Init sprite for drawing
    self.loadSprite = Sprite:new()
end

-- Update
function loadingState:update(dt)
    -- Load the required asset and remove it from the queue
    local currentAsset = self.loadList:getFront()

    if currentAsset ~= nil then
        self.assetManager:load(currentAsset.type, currentAsset.name, currentAsset.path)
        self.loadList:pop()
    end
end

-- Draw
function loadingState:draw()

    -- Update and draw the loading icon
    self.loadSprite:set(self.assetManager:getAsset("gui_icon_load"), true)
    self.loadSprite.rect.x = screen_width * 9 / 10
    self.loadSprite.rect.y = screen_height - screen_width / 10
    self.loadSprite.rect.w = screen_width / 10
    self.loadSprite.rect.h = screen_width / 10
    self.loadSprite:draw()

    -- Draw loading text
    Graphics.debugPrint(screen_width - self.loadSprite.rect.x, self.loadSprite.rect.y, "Loading...", color_white)
end

return loadingState