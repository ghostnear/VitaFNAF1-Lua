-- Global library includes
dofile('app0:/lib/external/class.lua')
dofile('app0:/lib/queue.lua')

-- Global core includes
dofile('app0:/core/globals.lua')
dofile('app0:/core/assetmanager.lua')
dofile('app0:/core/sprite.lua')
dofile('app0:/core/state.lua')

-- Create state manager and push the main state to the queue
local stateManager = dofile('app0:/core/statemanager.lua'):new()
stateManager:pushState(dofile('app0:/game/states/loadingState.lua'):new(stateManager))

-- Main loop
while not stateManager:canQuit() do
    -- Update
    stateManager:update(1 / 60)

    -- Start the rendering
    Graphics.initBlend()
    Screen.clear()
    
    -- Do the drawing
    stateManager:draw()

    -- End the rendering
    Graphics.termBlend()
    
    -- Update screen and wait for VSync
    Screen.flip()
    Screen.waitVblankStart()
end