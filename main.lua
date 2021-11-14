piece1 = {
    m = {
        {1,1,1},
        {1,0,1},
        {0,0,0}
    },
    x = 1,
    y = 1
}

board = {
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0}
}

function love.load()

end

function love.keypressed(key)
    if key == 'x' then
        piece1.m = rotate90ccw(piece1.m)
    elseif key == 'a' then
        piece1.x = piece1.x - 1
    elseif key == 's' then
        piece1.x = piece1.x + 1
    end
end

function reverseCols(m)
    m2 = {
        {0,0,0},
        {0,0,0},
        {0,0,0}
    }
    for i=1,3 do
        k=3
        for j=1,k do
            m2[j][i] = m[k][i]
            k = k - 1
        end
    end
    return m2
end

function transpose(m)
    m2 = {}
    for i=1,3 do
        m2[i] = {}
        for j=1,3 do
            m2[i][j] = m[j][i]
        end
    end
    return m2
end

function rotate90ccw(m)
    rm = {} --rotated matrix
    --transpose
    for i=1,3 do
        rm[i] = {}
        for j=1,3 do
            rm[i][j] = m[j][i]
        end
    end
    rc = {
        {0,0,0},
        {0,0,0},
        {0,0,0}
    }
    --reverse columns
    for i=1,3 do
        k=3
        for j=1,k do
            rc[j][i] = rm[k][i]
            k = k - 1
        end
    end
    return rc
end


function place(p, x, y)
    for i=1,3 do
        for j=1,3 do
            if p[i][j]==1 then

            end
        end
    end
end

function love.draw()
    --love.graphics.print("Hello World", 400, 300)

    for i=1,7 do
        for j=1,7 do
            if board[i][j] == 0 then
                love.graphics.setColor(1,1,1)
                love.graphics.rectangle(
                    'fill',
                    ((i - 1) * 65)+20,
                    ((j - 1) * 65)+20,
                    60,
                    60
                )
            end
        end
    end

    for i=1,3 do
        for j=1,3 do
            if piece1.m[i][j] == 1 then
                love.graphics.setColor(.3,.3,.3)
                love.graphics.rectangle(
                    'fill',
                    (((i - 1) ) * 65)+20+((piece1.x-1)*65),
                    (((j - 1) ) * 65)+20+((piece1.y-1)*65),
                    60,
                    60
                )   
            end
        end
    end 

end