-- Shows the warning
local warningState = State:extend()

-- Constructor
function warningState:init(stateM, assetM)
    -- Asset manager is carried from loading, no need to init it
    self.stateManager = stateM
    self.assetManager = assetM

    -- Warning sprite position
    self.warningSprite = Sprite:new()
    self.warningTimer = 0
    self.warningSprite:set(self.assetManager:getAsset("text_loading"), true)
    self.warningSprite.rect.x = screen_width * 2 / 4
    self.warningSprite.rect.y = screen_height * 4 / 8
    self.warningSprite.rect.w = screen_width * 1 / 2
    self.warningSprite.rect.h = screen_height * 1 / 4
end

function warningState:moveToMenu()
    -- Warning finished, move to menu
    local menuState = dofile('app0:/game/states/menuState.lua'):new(self.stateManager, self.assetManager)
    self.stateManager:pushState(menuState)
    self.stateManager:popState()
end

function warningState:update(dt)
    self.warningTimer = self.warningTimer + dt

    -- 2s wait
    if self.warningTimer >= 2 then
        -- 1s fade out
        if self.warningTimer >= 3 then
            self:moveToMenu()
        end

        self.warningSprite.tint = Color.new(255, 255, 255, (3 - self.warningTimer) * 255)
    end

    -- Skip intro using inputs
    if Input:check(SCE_CTRL_CROSS) or
       Input:check(SCE_CTRL_RTRIGGER) or 
       Input:check(SCE_CTRL_START) then
        self:moveToMenu()
    end
end

function warningState:draw()
    -- Draw the sprite
    self.warningSprite:draw()
end

function warningState:clean()
    self.assetManager:unload("text_loading")
end

return warningState