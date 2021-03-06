-- Loading screen, loads all assets and saves them in the AssetManager class
local loadingState = State:extend()
local json = dofile('app0:/lib/external/json.lua')

-- Constructor
function loadingState:init(stateM)
    -- Build asset manager
    self.assetManager = AssetManager:new()
    self.stateManager = stateM

    -- Open the load list from the assetlist file
    -- The game is relatively small so we can keep everything in memory as the Vita RAM allows us to
    self.loadList = Queue:new()
    local fileHandle = System.openFile("app0:/menuAssetList.json", FREAD)
    local fileString = System.readFile(fileHandle, System.sizeFile(fileHandle))
    local result = json.decode(fileString)
    for i, v in pairs(result) do
        self.loadList:push({
            type = v.type,
            name = v.name,
            path = v.path
        })
    end
    System.closeFile(fileHandle)

    -- Init sprite for drawing
    self.loadSprite = Sprite:new()
end

-- Update
function loadingState:update(dt)
    -- Load the required asset and remove it from the queue
    local currentAsset = self.loadList:getFront()

    if self.loadList:length() > 0 then
        self.assetManager:load(currentAsset.type, currentAsset.name, currentAsset.path)
        self.loadList:pop()
    else
        -- Loading finished, move to warning
        local warningState = dofile('app0:/game/states/warningState.lua'):new(self.stateManager, self.assetManager)
        self.stateManager:pushState(warningState)
        self.stateManager:popState()
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
    Graphics.debugPrint(
        screen_width - self.loadSprite.rect.x, self.loadSprite.rect.y,
        "Loading... ", color_white)
end

-- On clean
function loadingState:clean()
    self.assetManager:unload("gui_icon_load")
end

return loadingState