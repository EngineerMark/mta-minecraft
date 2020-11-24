ServerPlayer = {};
ServerPlayer.__index = ServerPlayer;
ServerPlayer.list = {};

addEvent("requestClientSyncPlayer", true);

function ServerPlayer:Create(element)
    local player = Player:Create(element);
    setmetatable(player, ServerPlayer);

    return player;
end

function ServerPlayer:Spawn()
    setElementFrozen(self.internalPlayer, true);
    setElementVectorPosition(self.internalPlayer, g_spawnPoint);
    setTimer(function()
    end, 100, 1);
end

function InternalRequestClientSyncPlayer()
    local sPlayer = ServerPlayer.list[client];
    print("Player "..getPlayerName(sPlayer.internalPlayer).." requested server to client sync");
    triggerClientEvent(sPlayer.internalPlayer, "syncPlayerToClient", resourceRoot, sPlayer);
end
addEventHandler("requestClientSyncPlayer", getRootElement(), InternalRequestClientSyncPlayer);

function InternalSyncPlayerToServer(cPlayer)
    local sPlayer = ServerPlayer.list[client];
    print("Player "..getPlayerName(sPlayer.internalPlayer).." synced client to server");
    sPlayer.inventory = cPlayer.inventory;
end
addEventHandler("syncPlayerToServer", getRootElement(), InternalSyncPlayerToServer);
