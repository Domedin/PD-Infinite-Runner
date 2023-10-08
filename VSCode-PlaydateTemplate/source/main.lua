import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "obstacle"
import "obstacleSpawner"
import "score"

local pd <const> = playdate
local gfx <const> = pd.graphics

CreateScoreDisplay()
Player(30, 120)
startSpawner()

function resetGame()
    resetScore()
    clearObstacles()
    stopSpawner()
	startSpawner()
    --screenShakeSprite:setShakeAmount(amount)
    --deathSound()
end

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end