ClientPlayer = {};
ClientPlayer.__index = ClientPlayer;
ClientPlayer.list = {};

addEvent("syncPlayerToClient", true);
addEvent("syncPlayerToServer", true);

function ClientPlayer:Create(element)
    local player = Player:Create(element);
    setmetatable(player, ClientPlayer);

    return player;
end

setmetatable(ClientPlayer, {__index = Player});

-- Triggered from server, to give player data to the client player
-- Useful for loading data from database and giving it to the client
function InternalSyncPlayerToClient(player)
    if(not ClientPlayer.list[player.internalPlayer])then ClientPlayer.list[player.internalPlayer] = ClientPlayer:Create(player.internalPlayer); end;

    local _player = ClientPlayer.list[player.internalPlayer];
    _player.inventory = player.inventory;

    SetGameInventory(_player);
    print("Synced server player to client for "..getPlayerName(player.internalPlayer));
end
addEventHandler("syncPlayerToClient", getRootElement(), InternalSyncPlayerToClient);

function InternalSyncPlayerToServer()
    if(not ClientPlayer.list[localPlayer])then print("Client player does not exist. Nothing to send to server."); return; end;
    triggerServerEvent("syncPlayerToServer", client, self);
end
addEventHandler("syncPlayerToServer", getRootElement(), InternalSyncPlayerToServer);