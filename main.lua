platform    = {}
player      = {}

-- branch2

function love.load()
    -- This is the height and the width of the platform
    platform.width  = love.graphics.getWidth()  -- This makes the platform as wide as the whole game window
    platform.height = love.graphics.getHeight() -- This makes the platform as high as the whole game window

    -- this is the coordinates where the platform will be rendered
    platform.x = 0
    platform.y = platform.height / 2

    -- This is the coordinates where the player character will be rendered.
    player.x = love.graphics.getWidth()  / 2
    player.y = love.graphics.getHeight() / 2

    player.img = love.graphics.newImage('player.png')

    player.speed = 200
    player.ground = player.y
    player.y_velocity = 0
    player.jump_height = -500
    player.gravity = -700

end

function love.update(dt)

    -- Moves player to the right
    if love.keyboard.isDown('d') then
        if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
            player.x = player.x + (player.speed * dt)
        end
    end

    -- Moves player to the left
    if love.keyboard.isDown('a') then
        if player.x > 0 then
            player.x = player.x - (player.speed * dt)
        end
    end

    if love.keyboard.isDown('w') then
        if player.y_velocity == 0 then
            player.y_velocity = player.jump_height
        end
    end

    if player.y_velocity ~= 0 then
        player.y = player.y + player.y_velocity * dt
        player.y_velocity = player.y_velocity - player.gravity * dt
    end

    if player.y > player.ground then
        player.y_velocity = 0
        player.y = player.ground
    end

end

function love.draw()
    love.graphics.setColor(255, 255, 255)

    -- The platform will now be drawn as a white rectangle while taking in the variables we declared above.
    love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

    -- This draws the player.
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end
