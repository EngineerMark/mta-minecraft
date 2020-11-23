ServerPlayer = {};
ServerPlayer.__index = ServerPlayer;

function ServerPlayer:create(element)
    local player = setmetatable({}, ServerPlayer);
    player.playerData = element;

    triggerClientEvent(player.playerData, "syncPlayerToClient", player);

    return player;
end

setmetatable(ServerPlayer, {__index = Player});