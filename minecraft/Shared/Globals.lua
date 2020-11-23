g_bottomHeight = 300;
g_spawnPoint = Vector:create(0,0,g_bottomHeight+2);
g_chunkSize = Vector:create(16, 16, 256); -- width, depth, height (x,y,z)
g_mapLimit = Vector:create(2500,2500); -- limit in each direction

g_bindings = {
    ["inventory"] = "e"
}