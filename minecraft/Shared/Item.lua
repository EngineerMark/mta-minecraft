Item = {};
Item.__index = Item;

function Item:Create()
	local t = setmetatable({}, Item);

	return t;
end