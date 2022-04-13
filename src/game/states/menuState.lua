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

    -- Button sprites inits
    self.buttonSprites = {}

    -- New game sprite position
    self.buttonSprites[1] = Sprite:new()
    self.buttonSprites[1]:set(self.assetManager:getAsset("text_button_1"), true)
    self.buttonSprites[1].rect.x = screen_width * 5 / 24
    self.buttonSprites[1].rect.y = screen_height * 8 / 15
    self.buttonSprites[1].rect.w = screen_width * 3 / 16
    self.buttonSprites[1].rect.h = screen_height * 1 / 19

    -- Arrows sprite position
    self.arrows = Sprite:new()
    self.arrows:set(self.assetManager:getAsset("gui_menu_arrows"), true)
    self.arrows.rect.w = screen_height * 1 / 19
    self.arrows.rect.h = screen_height * 1 / 19
    self.arrows.rect.x = screen_width * 5 / 24 - self.arrows.rect.w * 4.5
    self.arrows.rect.y = screen_height * 8 / 15
    self.arrowindex = 1

    -- Continue sprite position
    self.buttonSprites[2] = Sprite:new()
    self.buttonSprites[2]:set(self.assetManager:getAsset("text_button_2"), true)
    self.buttonSprites[2].rect.x = screen_width * 5 / 24
    self.buttonSprites[2].rect.y = screen_height * 10 / 15
    self.buttonSprites[2].rect.w = screen_width * 3 / 16
    self.buttonSprites[2].rect.h = screen_height * 1 / 19

    -- Sixth night sprite position
    self.buttonSprites[3] = Sprite:new()
    self.buttonSprites[3]:set(self.assetManager:getAsset("text_button_sixth_night"), true)
    self.buttonSprites[3].rect.x = screen_width * 21 / 96
    self.buttonSprites[3].rect.y = screen_height * 12 / 15
    self.buttonSprites[3].rect.w = screen_width * 3 / 16 / 8 * 9
    self.buttonSprites[3].rect.h = screen_height * 1.25 / 19

    -- Custom Night sprite position
    self.buttonSprites[4] = Sprite:new()
    self.buttonSprites[4]:set(self.assetManager:getAsset("text_button_custom_night"), true)
    self.buttonSprites[4].rect.x = screen_width * 51 / 200
    self.buttonSprites[4].rect.y = screen_height * 14 / 15
    self.buttonSprites[4].rect.w = screen_width * 3 / 16 / 8 * 12
    self.buttonSprites[4].rect.h = screen_height * 1.25 / 19
    
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

    -- Update the arrow sprite
    self.arrows.rect.y = self.buttonSprites[self.arrowindex].rect.y
    if Input:checkPressed(SCE_CTRL_UP) then
        if self.arrowindex > 1 then
            self.arrowindex = self.arrowindex - 1;
            Sound.play(self.assetManager:getAsset("sound_blip3").id, false)
        end
    end
    if Input:checkPressed(SCE_CTRL_DOWN) then
        if self.arrowindex < 4 then
            self.arrowindex = self.arrowindex + 1;
            Sound.play(self.assetManager:getAsset("sound_blip3").id, false)
        end
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
    for i, k in pairs(self.buttonSprites) do
        k:draw()
    end
    self.arrows:draw()
end

function menuState:clear()
    self.assetManager:unload("sound_darkness_music")
    self.assetManager:unload("sound_static2")
    self.assetManager:unload("sound_blip3")
end

return menuState