-- Global library includes
dofile('app0:/lib/external/class.lua')
dofile('app0:/lib/queue.lua')

-- Global core includes
dofile('app0:/core/globals.lua')
dofile('app0:/core/state.lua')

-- Create state manager and push the main state to the queue
local stateManager = dofile('app0:/core/statemanager.lua'):new()
stateManager:pushState(dofile('app0:/game/states/mainState.lua'):new())

-- Main loop
while not stateManager:canQuit() do

    -- Input testing
    pad = Controls.read()
    if Controls.check(pad, SCE_CTRL_CROSS) then
        
    end
    if Controls.check(pad, SCE_CTRL_CIRCLE) then

    end
    if Controls.check(pad, SCE_CTRL_TRIANGLE) then
        -- This efectively closes the app if no more states are added
        stateManager:clearStates()
    end

    -- Start the rendering
    Graphics.initBlend()
    Screen.clear()
    
    -- Do the drawing
    stateManager:draw()

    -- End the rendering
    Graphics.termBlend()

    -- Update screen
    Screen.flip()
end