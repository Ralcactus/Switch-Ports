event_inherited();

if (inPipe)
    exit;

var _idle = asset_get_index(string("spr_bom_{0}", col_to_str(col)));
var _edge = asset_get_index(string("spr_bom_{0}_edge", col_to_str(col)));

if (timer[0] <= 360 && !in_tutorial)
{
    if (!edge)
    {
        edge = true;
        hey_scale = 1.5;
    }
    
    if (anim_sprite != _edge)
    {
        yscale_squish = 1.3;
        xscale_squish = 0.7;
    }
    
    anim_play(_edge);
}
else
{
    anim_play(_idle);
}
