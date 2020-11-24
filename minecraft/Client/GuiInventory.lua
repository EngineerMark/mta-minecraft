GuiInventory = {};
GuiInventory.__index = GuiInventory;

function GuiInventory:Create(position, size)
	local gui = GuiElement:Create(position, size);
	setmetatable(gui, GuiInventory);
	gui.type = "GuiInventory";

	gui.playerInventory = nil;

	return gui;
end

function GuiInventory:Update()
	GuiElement.Update(self);
end

function GuiInventory:Draw()
	if(self.visible)then
		dxDrawText("wow",0,0,ScreenResolution.x, ScreenResolution.y);
	end
end