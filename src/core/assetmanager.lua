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
    if type == "image" then
        Graphics.freeImage(asset.file)
    end
end