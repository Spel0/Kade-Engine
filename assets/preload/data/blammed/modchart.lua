local a
local b
local c
local d
local flipped = false
local animation = false
local firstTime = true

function start(song)
    print(song)
end

function update(elapsed)
    if flipped and not animation then
        if mustHit == 1 then
            followXOffset = 400
        else
            followXOffset = -400
        end
    elseif not animation then
        followXOffset = 0
    end
end

function flipBF()
    if not flipped then
        setActorFlipX(true, 'boyfriend')
    else
        setActorFlipX(false, 'boyfriend')
    end
end

function flipDad()
    if not flipped then
        setActorFlipX(false, 'dad')
    else
        setActorFlipX(true, 'dad')
    end
end

function offset()
    animation = false
    tweenCameraZoom(1.05, 1)
    flipped = not flipped
        local first = getActorX(4)
        local second = getActorX(5)
        local third = getActorX(6)
        local fourth = getActorX(7)
            
        setActorX(first, 7)
        setActorX(second, 6)
        setActorX(third, 5)
        setActorX(fourth, 4)
        setActorFlipX(false, 7)
        setActorFlipX(false, 6)
        setActorFlipX(false, 5)
        setActorFlipX(false, 4)
        setActorFlipY(false, 6)
        setActorFlipY(false, 5)
end

function switchSides()
    if firstTime then
        a = getActorX('dad')
        b = getActorX('boyfriend')
        c = getActorY('boyfriend')
        d = getActorY('dad')

        tweenCameraZoom(2, 1)
        tweenPosIn('boyfriend', a, c, 1, "flipBF")
        tweenPosIn('dad', b, d, 1, "flipDad")
        if getProperty('combo') == 0 then
            playActorAnimation('boyfriend', 'hit', true)
            setHealth(0.5)
        else
            playActorAnimation('boyfriend', 'dodge', true)
        end
        firstTime = false
        animation = true
        tweenHudAngle(180, 1.01, 'offset')
    elseif not flipped then
        a = getActorX('dad')
        b = getActorX('boyfriend')
        c = getActorY('boyfriend')
        d = getActorY('dad')
        tweenCameraZoom(2, 1)
        tweenPosIn('boyfriend', a, c, 1, "flipBF")
        tweenPosIn('dad', b, d, 1, "flipDad")
        animation = true
        tweenHudAngle(180, 1.01, 'offset')
    elseif flipped then
        if mustHit == 1 then
            followXOffset = -400
        else
            followXOffset = 400 
        end
        a = getActorX('dad')
        b = getActorX('boyfriend')
        c = getActorY('boyfriend')
        d = getActorY('dad')
        tweenCameraZoom(2, 1)
        tweenPosIn('boyfriend', a, c, 1, "flipBF")
        tweenPosIn('dad', b, d, 1, "flipDad")
        animation = true
        tweenHudAngle(0, 1.01, 'offset')
    end
end

function beatHit(beat)

end

function stepHit(step)
    if step == 130 or step == 382 or step == 511 or step == 638 or step == 766 then
        if step == 511 or step == 63 or step == 766 then
            animation = true
            followXOffset = -400
        end
       switchSides()
    end
    if step == 126 then
        animation = true
        followXOffset = -400
    end
end