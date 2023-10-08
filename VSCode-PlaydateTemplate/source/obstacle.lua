local pd <const> = playdate
local gfx <const> = pd.graphics

class("Obstacle").extends(gfx.sprite)

function Obstacle:init(x, y, moveSpeed)
    local obstacleImage = gfx.image.new("images/obstacle")
    self:setImage(obstacleImage)
    self:moveTo(x, y)
    self:add()

    self:setCollideRect(0, 0, self:getSize())

    self.moveSpeed = moveSpeed
end

function Obstacle:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x -self.moveSpeed, self.y)    
    if length > 0 then
        for index, collision in pairs(collisions) do
            local collidedObject = collision['other']
            if collidedObject:isa(Player) then
                resetGame()
            end
        end
    end
    if self.x < -30 then
        incrementScore()
        self:remove()
    end
end

function Obstacle:collisionResponse()
    return "overlap"
end