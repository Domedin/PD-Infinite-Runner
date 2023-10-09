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

local deathSound = playdate.sound.sampleplayer.new("sound/deathSound.wav")
local pointSound = playdate.sound.sampleplayer.new("sound/point.wav")

function Obstacle:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x -self.moveSpeed, self.y)    
    if length > 0 then
        for index, collision in pairs(collisions) do
            local collidedObject = collision['other']
            if collidedObject:isa(Player) then
                resetGame()
                deathSound:play(1)
            end
        end
    end
    if self.x < -25 then
        incrementScore()
        pointSound:play(1)
        self:remove()
    end
end

function Obstacle:collisionResponse()
    return "overlap"
end