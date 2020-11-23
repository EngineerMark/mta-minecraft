Inventory = {};
Inventory.__index = Inventory;

function Inventory:create()
    local i = setmetatable({}, Inventory);

    return i;
end