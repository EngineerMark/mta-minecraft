Inventory = {};
Inventory.__index = Inventory;

function Inventory:create()
    local i = setmetatable({}, Inventory);

    i.mainInventory = {};
    i.armorInventory = {};
    i.craftingInventory = {};

    i.currentItem = 0;


    return i;
end

function Inventory:GetCurrentItem()
    return self.mainInventory[self.currentItem];
end