ServerPlayer = {};
ServerPlayer.__index = ServerPlayer;
ServerPlayer.list = {};

addEvent("requestClientSyncPlayer", true);

function ServerPlayer:Create(element)
    local player = setmetatable({}, ServerPlayer);
    player.internalPlayer = element;


    return player;
end

function ServerPlayer:Spawn()
    setElementFrozen(self.internalPlayer, true);
    setElementVectorPosition(self.internalPlayer, g_spawnPoint);
    setTimer(function()
    end, 100, 1);
end

setmetatable(ServerPlayer, {__index = Player});

function InternalRequestClientSyncPlayer()
    local sPlayer = ServerPlayer.list[source];
    print("Player "..getPlayerName(sPlayer.internalPlayer).." requested server to client sync");
    triggerClientEvent(sPlayer.internalPlayer, "syncPlayerToClient", resourceRoot, sPlayer);
end
addEventHandler("requestClientSyncPlayer", getRootElement(), InternalRequestClientSyncPlayer);