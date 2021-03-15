GameSettings = {};
GameSettings.__index = GameSettings;

function GameSettings:Create()
    local config = {};
    setmetatable(config, GameSettings);
    
    return config;
end
