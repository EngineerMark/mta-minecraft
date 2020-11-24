ScreenResolution = Vector:Create(guiGetScreenSize());

GuiElement = {};
GuiElement.__index = GuiElement;
GuiElement.GLOBAL_ID = 0;

function GuiElement:Create(position, size)
	local gui = setmetatable({}, GuiElement);
	gui.ID = GuiElement.GLOBAL_ID;
	GuiElement.GLOBAL_ID = GuiElement.GLOBAL_ID+1;
	gui.type = "GuiElement";
	gui.visible = true;

	gui.position = position;
	gui.size = size or Vector:Create(0,0);

	print("Created new GuiElement object with ID "..gui.ID);

	return gui;
end

function GuiElement.Update(guiElement)
end

function GuiElement:GetType()
	return self.type;
end
