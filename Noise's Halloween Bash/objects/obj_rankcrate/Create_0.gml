startdepth = depth;
hsp = 0;
vsp = 0;
grav = 0.5;
var _gw = get_game_width();
var _gh = get_game_height();
middlex = _gw / 2;

switch (type ?? Rank.Perfect)
{
    case Rank.Perfect:
        x = middlex;
        y = -100;
        vsp = 8;
        break;
    
    case Rank.Good:
        x = 16;
        break;
    
    case Rank.Meh:
        x = _gw - 16;
        break;
}

if (type == Rank.Good || type == Rank.Meh)
{
    y = _gh + 64;
    var _motion = calculate_projectile_motion(x, y, middlex, 365, grav, 48);
    hsp = _motion.hsp;
    vsp = _motion.vsp;
}
