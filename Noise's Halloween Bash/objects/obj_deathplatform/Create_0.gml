event_inherited();

in_room = function()
{
    return room == startingroom || room == targetroom;
};

canCollide = function(_id, _x, _y)
{
    return in_room() && (obj_player.diddeathroute || !global.playerhit);
};

if (returnTrip)
{
    pathB = obj_player.beforedeathroute.path;
    targetroom = obj_player.beforedeathroute.room;
}

if (!is_undefined(pathA))
{
    originalPathA = pathA;
    pathA = path_duplicate(pathA);
}

if (!is_undefined(pathB))
    pathB = path_duplicate(pathB);

if (returnTrip)
    path_reverse(pathB);

depth += 8;
z = 0;
zstart = z;
spin = 0;
model = "DeathPlatform";
palettespr = spr_deathplatpal;
curpalette = 0;
lightlevel = 1;
startingroom = room;
checkbuffer = 0;
playerstillonplatform = false;
platformmovetimer = 40;
reachedhalfway = false;
moveSpd = 1;
lerpval = 0;
currpath = pathA;
