-- Sprite class
Sprite = class()
Sprite.rect = nil
Sprite.tint = nil
Sprite.angle = nil
Sprite.insideRect = nil
Sprite.width = nil
Sprite.height = nil
Sprite.image = nil

-- Main init function
function Sprite:init()
    self.rect = {
        x = 0,
        y = 0,
        w = 0,
        h = 0
    }
    self.insideRect = {
        x = 0,
        y = 0,
        w = 0,
        h = 0
    }
    self.angle = 0
    self.tint = color_white
end

-- Sets the sprite image
function Sprite:set(image, updateSizes)
    if image ~= nil then
        self.image = image.id
        self.width = Graphics.getImageWidth(image.id)
        self.height = Graphics.getImageHeight(image.id)

        if updateSizes then
            self.rect.x = 0
            self.rect.y = 0
            self.rect.w = self.width
            self.rect.h = self.height
            self.insideRect.x = 0
            self.insideRect.y = 0
            self.insideRect.w = self.width
            self.insideRect.h = self.height
        end
    end
end

-- Draws the sprite
function Sprite:draw()
    if self.image ~= nil then
        Graphics.drawImageExtended(
            self.rect.x, self.rect.y, self.image,
            self.insideRect.x, self.insideRect.y, self.insideRect.w, self.insideRect.h,
            self.angle, self.rect.w / self.width, self.rect.h / self.height, self.tint)
    end
end