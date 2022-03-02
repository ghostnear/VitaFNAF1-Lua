-- Loading screen, loads all assets and saves them in the AssetManager class
local loadingState = State:new()
loadingState.loadList = nil

-- Constructor
function loadingState:init()
    -- Build asset manager
    self.assetManager = AssetManager:new()

    -- TODO: get this from an XML or something similar
    self.loadList = Queue:new()
    self.loadList:push({
        type = "image",
        name = "gui_icon_load",
        path = "external/assets/gui/loader.png"
    })
end

-- Update
function loadingState:update(dt)
    -- Load the required asset and remove it from the queue
    local currentAsset = self.loadList:getFront()
    self.assetManager:load(currentAsset.type, currentAsset.name, currentAsset.path)
    self.loadList:pop()

    -- Check if the queue is empty
    if self.loadList:length() == 0 then

    end
end

-- Draw
function loadingState:draw()
    -- Check if loading icon is loaded
    local loading_icon = self.assetManager:get("gui_icon_load")
    if loading_icon ~= nil then
        -- Draw the icon
        Graphics.drawScaleImage(50, 100, loading_icon.id, 1, 1)
    end
end

return loadingState