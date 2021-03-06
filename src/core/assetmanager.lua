-- Asset manager class
AssetManager = class()
AssetManager.assets = nil

-- Main init function
function AssetManager:init()
    self.assets = {}
end

-- Load an asset
function AssetManager:load(type, name, path)
    -- Load an image
    if type == "image" then
        self.assets[name] = {
            type = "image",
            id = Graphics.loadImage("app0:/" .. path)
        }
    elseif type == "animatedimage" then
        self.assets[name] = {
            type = "animatedimage",
            id = Graphics.loadAnimatedImage("app0:/" .. path)
        }
    elseif type == "sound" then
        self.assets[name] = {
            type = "sound",
            id = Sound.open("app0:/" .. path)
        }
    end
end

-- Get
function AssetManager:getAsset(name)
    return self.assets[name]
end

-- Free an asset
function AssetManager:unload(name)
    -- Pointer to the asset
    local asset = self.assets[name]
    if type == "image" or type == "animatedimage" then
        Graphics.freeImage(asset.id)
    elseif type == "sound" then
        if Sound.isPlaying(asset.id) then
            Sound.pause(asset.id)
        end
        Sound.close(asset.id)
    end
end