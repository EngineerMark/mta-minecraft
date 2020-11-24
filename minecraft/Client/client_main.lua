function Start()
    showChat(false);
    fadeCamera(true, 0);
    guiSetInputMode("no_binds_when_editing");
    showPlayerHudComponent("all", false);

    setCameraTarget(getLocalPlayer());
    
    local test = Vector:create(0, 5);
    local testChunk = Chunk:create();

    addEventHandler("onClientPreRender", getRootElement(), PreUpdate);
    addEventHandler("onClientRender", getRootElement(), Update);

    triggerServerEvent("requestClientSyncPlayer", localPlayer);
end
addEventHandler("onClientResourceStart", resourceRoot, Start);

function PreUpdate(msTime)

end

function Update()

end