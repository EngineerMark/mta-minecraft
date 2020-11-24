local server_players = {};

function Start()
    setGameType("Minecraft");

    for _, player in pairs(getElementsByType("player"))do
        local _player = ServerPlayer:Create(player);
        ServerPlayer.list[player] = _player;
        _player:Spawn();
    end

    addEventHandler("onPlayerJoin", getRootElement(), OnPlayerJoin);
    addEventHandler("onPlayerQuit", getRootElement(), OnPlayerQuit);
    addEventHandler("onResourceStop", getRootElement(), Stop);

    -- Bottom limit for anything
    local GLOBAL_COLLISION = createColCuboid(g_spawnPoint.x-20, g_spawnPoint.y-20, g_spawnPoint.z-20, 40, 40, 15);

    print("Gamemode Minecraft STARTED");
end
addEventHandler("onResourceStart", resourceRoot, Start);

function Stop()
    for _,v in pairs(ServerPlayer.list)do
        --v:save();
    end
end

function OnPlayerJoin()
    local _player = ServerPlayer:Create(source);
    ServerPlayer.list[source] = _player;
    _player:Spawn();
end

function OnPlayerQuit()
    _player:save();
    ServerPlayer.list[_player.playerData] = nil;
end