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
end

-- Gets first element of the queue
function Queue:getFront()
    return self.elements[self.front]
end

-- Gets last element of the queue
function Queue:getBack()
    return self.elements[self.back]
end

-- Gets all the elements of the queue
function Queue:getContainer()
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