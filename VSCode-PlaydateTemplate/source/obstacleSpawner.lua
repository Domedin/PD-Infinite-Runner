import "obstacle"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawner()
    math.randomseed(pd.getSecondsSinceEpoch())
    createTimer()
end

function createTimer()
    local spawnTime = 1000
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function ()
        createTimer()
        spawnObstacle()
    end)
end

function spawnObstacle()
    local spawnPosition = math.random(1, 3)
    if spawnPosition == 1 then
        spawnPosition = 60
    elseif spawnPosition == 2 then
        spawnPosition = 120
    elseif spawnPosition == 3 then
        spawnPosition = 180
    end
    Obstacle(430, spawnPosition, 5)
end

function stopSpawner()
    if spawnTimer then
        spawnTimer:remove()
    end
end

function clearObstacles()
    local allSprites = gfx.sprite.getAllSprites()
    for index, sprite in ipairs(allSprites) do
        if sprite:isa(Obstacle) then
            sprite:remove()
        end
    end
end