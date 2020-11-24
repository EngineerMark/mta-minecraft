Player = {};
Player.__index = Player;

function Player:Create(element)
    local t = setmetatable({}, Player);

    t.internalPlayer = element;
    t.inventory = false;

    return t;
end
