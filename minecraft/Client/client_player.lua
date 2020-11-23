ClientPlayer = {};
ClientPlayer.__index = ClientPlayer;

addEvent("syncPlayerToClient", true);

function ClientPlayer:create(element)
    local player = setmetatable({}, ClientPlayer);
    player.playerData = element;
    return player;
end

setmetatable(ClientPlayer, {__index = Player});