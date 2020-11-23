Player = {};
Player.__index = Player;

function Player:create(element)
    local t = setmetatable({}, Player);

    t.playerData = element;
    t.inventory = false;

    return t;
end

function Player:serverSpawn()
    setElementFrozen(self.playerData, true);
    setElementVectorPosition(self.playerData, g_spawnPoint);
end

function Player:save()

end