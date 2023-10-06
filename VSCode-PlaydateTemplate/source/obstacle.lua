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
    self:moveBy(-self.moveSpeed, 0)
    if self.x < 0 then
        --Score()
    end
end

function Obstacle:collisionResponse()
    return "overlap"
end