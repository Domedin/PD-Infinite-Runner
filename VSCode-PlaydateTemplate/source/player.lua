local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    Player.super.init(self, playerImage)
    self:moveTo(x, y)
    self:add()
    self:setCollideRect(0, 0, self:getSize())
    self.crankPos = 0
end

function Player:update()
    self.crankPos = pd.getCrankPosition()
    self:Movement(self.crankPos)
end

function Player:Movement(crankPos)
    crankPos = -crankPos % 360
    if crankPos < 180 then
        self:moveTo(30, crankPos * 4/3)
    end
end