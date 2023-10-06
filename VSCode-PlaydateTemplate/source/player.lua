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

    return self
end

function Player:update()
    self.crankPos = pd.getCrankPosition()
    self:Movement(self.crankPos)
end

function Player:Movement(crankPos)
    self:crankTry5(crankPos)
end

function Player:crankTry1(crankPos) -- almost worked but it is reversed
    if crankPos < 180 then
        self:moveTo(30, crankPos * 4/3)
    end
end

function Player:crankTry2(crankPos) -- works sorta when subtracting 180 from crankpos input
    print(crankPos)
    if crankPos < 180 then
        self:moveTo(30, 240 - (crankPos * 4/3))
    elseif crankPos < 0 then
        self:moveTo(30, 240)
    end
end

function Player:crankTry3(crankPos)
    self:moveTo(30, (((crankPos + 180) % 360) * 4/3) - 240)
end

function Player:crankTry4(crankPos)
    if crankPos < 180 then
        self:moveTo(30, 240 - (crankPos * 4/3))
    elseif crankPos < 0 then
        self:moveTo(30, 240)
    end
end

function Player:crankTry5(crankPos)
    crankPos = -crankPos % 360
    if crankPos < 180 then
        self:moveTo(30, crankPos * 4/3)
    end
end