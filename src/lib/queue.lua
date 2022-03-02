-- @name: <none>
-- @description: Queue library implementation.
-- @github: <none>

-- Initialises queue class
Queue = class()
Queue.back = nil
Queue.front = nil
Queue.elements = nil
Queue.optimiseFactor = 5

-- Initialises the queue
function Queue:init()
    self:clear()
    self.optimiseFactor = 2
end

-- Pushes back one element to the queue
function Queue:push(value)
    self.elements[self.back] = value
    self.back = self.back + 1
end

-- Pops one element from the queue
function Queue:pop()
    -- Remove the first element
    self.elements[self.front] = nil
    self.front = self.front + 1

    -- Rebuild if needed
    self:rebuild()
end

-- Gets first element of the queue
function Queue:first()
    return self.elements[self.front]
end

-- Gets all the elements of the queue
function Queue:getContainer()
    -- Always optimise container before sending it
    self:rebuild()
    return self.elements
end

-- Gets container length
function Queue:length()
    return (self.back - self.front)
end

-- Clears the queue
function Queue:clear()
    self.back = 0
    self.front = 0
    self.elements = {}
end

-- Rebuilds table for optimization purposes
function Queue:rebuild()
    -- Don't rebuild the table every time, it's going to take a lot of CPU time
    -- Do only when having more than self.optimiseFactor * self.optimiseFactor elements
    if self.front * self.optimiseFactor > self.back and self.front >= self.optimiseFactor then

        -- Build new table and copy current values
        local newTable = {}
        for i = self.front, i < self.back, 1 do
            newTable[i - self.front] = self.elements[i]
        end
        
        -- Set new rebuilt values
        self.elements = newTable
        self.front = 0
        self.back = #self.elements
    end
end