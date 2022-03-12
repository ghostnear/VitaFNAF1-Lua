-- Main menu handler
local menuState = State:extend()

-- Constructor
function menuState:init(stateM, assetM)
    -- Asset manager is carried from loading, no need to init it
    self.stateManager = stateM
    self.assetManager = assetM

    -- Background sprite position and frame
    self.backgroundSprite = Sprite:new()
    self.backgroundFrame = 1
    self.backgroundTimer = 0
    self.backgroundSprite:set(self.assetManager:getAsset("menu_background_1"), true)
    self.backgroundSprite.rect.x = screen_width / 2
    self.backgroundSprite.rect.y = screen_height / 2
    self.backgroundSprite.rect.w = screen_width
    self.backgroundSprite.rect.h = screen_height

    -- Static sprite position and frame
    self.staticSprite = Sprite:new()
    self.staticFrame = 1
    self.staticTimer = 0
    self.staticSprite.tint = Color.new(255, 255, 255, 25)
    self.staticSprite:set(self.assetManager:getAsset("static_1"), true)
    self.staticSprite.rect.x = screen_width / 2
    self.staticSprite.rect.y = screen_height / 2
    self.staticSprite.rect.w = screen_width
    self.staticSprite.rect.h = screen_height
end

function menuState:update(dt)
    -- Auxiliary variable
    local aux = nil

    -- Update the background sprite
    self.backgroundTimer = self.backgroundTimer + dt
    while self.backgroundTimer > 0.08 do
        aux = math.random(0, 100)
        if aux < 97 then
            self.backgroundFrame = 1
        else
            self.backgroundFrame = aux - 95
        end
        self.backgroundSprite.tint = Color.new(255, 255, 255, math.random(0, 255))
        self.backgroundSprite:set(self.assetManager:getAsset("menu_background_" .. self.backgroundFrame), false)
        self.backgroundTimer = self.backgroundTimer - 0.08
    end

    -- Update the static sprite
    self.staticTimer = self.staticTimer + dt
    self.staticFrame = (self.staticFrame + 1) % 8 + 1
    while self.staticTimer > 0.09 do
        aux = math.random(25, 75)
        self.staticSprite.tint = Color.new(255, 255, 255, aux)
        self.staticSprite:set(self.assetManager:getAsset("static_" .. self.staticFrame), false)
        self.staticTimer = self.staticTimer - 0.09
    end
end

function menuState:draw()
    -- Draw the background sprites
    self.backgroundSprite:draw()
    self.staticSprite:draw()
end

return menuState