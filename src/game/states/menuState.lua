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

    -- Game title sprite position
    self.gameTitleSprite = Sprite:new()
    self.gameTitleSprite:set(self.assetManager:getAsset("text_game_title"), true)
    self.gameTitleSprite.rect.x = screen_width * 5 / 24
    self.gameTitleSprite.rect.y = screen_height * 7 / 27
    self.gameTitleSprite.rect.w = screen_width * 3 / 16
    self.gameTitleSprite.rect.h = screen_height * 1 / 3

    -- New game sprite position
    self.button1Sprite = Sprite:new()
    self.button1Sprite:set(self.assetManager:getAsset("text_button_1"), true)
    self.button1Sprite.rect.x = screen_width * 5 / 24
    self.button1Sprite.rect.y = screen_height * 2 / 3
    self.button1Sprite.rect.w = screen_width * 3 / 16
    self.button1Sprite.rect.h = screen_height * 1 / 19

    -- Continue sprite position
    self.button2Sprite = Sprite:new()
    self.button2Sprite:set(self.assetManager:getAsset("text_button_2"), true)
    self.button2Sprite.rect.x = screen_width * 9 / 24
    self.button2Sprite.rect.y = screen_height * 2 / 3
    self.button2Sprite.rect.w = screen_width * 3 / 16
    self.button2Sprite.rect.h = screen_height * 1 / 19
    
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

    -- "Darkness music"
    Sound.play(self.assetManager:getAsset("sound_darkness_music").id, true)
    Sound.play(self.assetManager:getAsset("sound_static2").id, false)
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

    -- Draw text
    self.gameTitleSprite:draw()
    self.button1Sprite:draw()
    self.button2Sprite:draw()
end

function menuState:clear()
    self.assetManager:unload("sound_darkness_music")
    self.assetManager:unload("sound_static2")
end

return menuState