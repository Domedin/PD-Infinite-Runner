import "obstacle"

local pd <const> = playdate
local gfx <const> = pd.graphics

local spawnTimer

function startSpawner()
    math.randomseed(pd.getSecondsSinceEpoch())
    createTimer(7, 1000)
end

function createTimer(spawnSpeed, spawnTime)
    spawnTimer = pd.timer.performAfterDelay(spawnTime, function ()
        spawnSpeed *= 1.01
        spawnTime -= 2
        createTimer(spawnSpeed, spawnTime)
        spawnObstacle(spawnSpeed)
        print(spawnTime)
    end)
end

function spawnObstacle(spawnSpeed)
    local spawnPosition = math.random(1, 3)
    if spawnPosition == 1 then
        spawnPosition = 40
    elseif spawnPosition == 2 then
        spawnPosition = 120
    elseif spawnPosition == 3 then
        spawnPosition = 200
    end
    Obstacle(430, spawnPosition, spawnSpeed)
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