ClientPlayer = {};
ClientPlayer.__index = ClientPlayer;
ClientPlayer.list = {};

addEvent("syncPlayerToClient", true);

function ClientPlayer:Create(element)
    local player = setmetatable({}, ClientPlayer);
    player.internalPlayer = element;

    return player;
end

setmetatable(ClientPlayer, {__index = Player});

function InternalSyncPlayerToClient(player)
    if(not ClientPlayer.list[player.internalPlayer])then ClientPlayer.list[player.internalPlayer] = ClientPlayer:Create(player.internalPlayer); end;

    local _player = ClientPlayer.list[player.internalPlayer];
    _player.inventory = player.inventory;
    print("Synced server player to client for "..getPlayerName(player.internalPlayer));
end
addEventHandler("syncPlayerToClient", getRootElement(), InternalSyncPlayerToClient);
