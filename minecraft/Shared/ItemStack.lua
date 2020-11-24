ItemStack = {};
ItemStack.__index = ItemStack;

function ItemStack:Create()
	local t = setmetatable({}, ItemStack);

	t.itemID = 0;

	return t;
end