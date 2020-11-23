local server_players = {};

function Start()
    setGameType("Minecraft");

    for _, player in pairs(getElementsByType("player"))do
        local _player = ServerPlayer:create(player);
        server_players[player] = _player;
        _player:serverSpawn();
    end

    addEventHandler("onPlayerJoin", getRootElement(), OnPlayerJoin);
    addEventHandler("onPlayerQuit", getRootElement(), OnPlayerQuit);
    addEventHandler("onResourceStop", getRootElement(), Stop);

    -- Bottom limit for anything
    local GLOBAL_COLLISION = createColCuboid(g_spawnPoint.x-20, g_spawnPoint.y-20, g_spawnPoint.z-20, 40, 40, 15);
end
addEventHandler("onResourceStart", resourceRoot, Start);

function Stop()
    for _,v in pairs(server_players)do
        v:save();
    end
end

function OnPlayerJoin()
    local _player = ServerPlayer:create(source);
    server_players[source] = _player;
    _player:serverSpawn();
end

function OnPlayerQuit()
    _player:save();
    server_players[_player.playerData] = nil;
end