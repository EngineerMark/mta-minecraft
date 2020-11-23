Chunk = {};
Chunk.__index = Chunk;

function Chunk:create(position)
    local c = setmetatable({}, Chunk);

    c.position = position;
    c.blockData = {};

    local start = getTickCount();
    c:build();
    local _end = getTickCount();

    print("Chunk created: "..(_end-start).."ms");

    return c;
end

function Chunk:build()
    for x=1,g_chunkSize.x do
        self.blockData[x] = {};
        for y=1,g_chunkSize.y do
            self.blockData[x][y] = {};
            for z=1,g_chunkSize.z do
                if(z==1)then
                    self.blockData[x][y][z] = 1;
                else
                    self.blockData[x][y][z] = 0;
                end
            end
        end
    end
end