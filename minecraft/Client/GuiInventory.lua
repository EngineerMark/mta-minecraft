GuiInventory = {};
GuiInventory.__index = GuiInventory;

function GuiInventory:Create(position, size)
	local gui = GuiElement:Create(position, size);
	setmetatable(gui, GuiInventory);

	gui.playerInventory = nil;

	return gui;
end
