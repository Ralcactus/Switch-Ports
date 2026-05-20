res_i();
res_j();
wall = false;

step = function()
{
    if (oPlayer.x > 640)
    {
        i++;
        
        if (i > 1 && !(i % 20))
            spawnEEF(480, 0, sAlex_MySuperFuckingCooolDarwawing, 0, "ghostDie,drawN");
        
        if (!(oPlayer.x == oPlayer.pastX && oPlayer.y == oPlayer.pastY))
            spawnEEF(oPlayer.x, oPlayer.y - 70, sWow, 0, "alex,drawN");
    }
};

draw = function()
{
    if (i > 1)
    {
        if (j < 1)
            j += 0.005;
        
        ext(sAlex_MySuperFuckingCooolDarwawing, 3, 0, 0, 1, 1, undefined, undefined, j);
    }
};
