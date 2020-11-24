g_bottomHeight = 300;
g_spawnPoint = Vector:Create(0,0,g_bottomHeight+2);
g_chunkSize = Vector:Create(16, 16, 256); -- width, depth, height (x,y,z)
g_mapLimit = Vector:Create(2500,2500); -- limit in each direction

g_bindings = {
    ["inventory"] = "e"
}