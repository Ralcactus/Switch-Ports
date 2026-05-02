with (instance_nearest(x, y, obj_parent_player))
{
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_87 && movespeed >= 8)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_87 && sprite_index == spr_player_PZ_cotton_attack)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_97)
    {
        with (other.id)
            instance_destroy();
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp > 0) || place_meeting(x, y + 1, other.id)) && state == UnknownEnum.Value_96)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_100)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == UnknownEnum.Value_107 || state == UnknownEnum.Value_108))
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && (state == UnknownEnum.Value_107 || state == UnknownEnum.Value_108))
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_132)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && state == UnknownEnum.Value_132)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_132)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && state == UnknownEnum.Value_132)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == UnknownEnum.Value_150 || state == UnknownEnum.Value_152 || state == UnknownEnum.Value_151))
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id)) && (state == UnknownEnum.Value_152 || state == UnknownEnum.Value_151))
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_139 && substate == 0)
    {
        with (other.id)
            instance_destroy();
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_79)
    {
        with (other.id)
            instance_destroy();
    }    
	
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && state == UnknownEnum.Value_82)
    {
        with (other.id)
            instance_destroy();
    }
}

if (place_meeting(x, y, obj_bombExplosionPlayer) && instance_place(x, y, obj_bombExplosionPlayer).frog)
    instance_destroy();

with (instance_nearest(x, y, obj_minedummycart))
{
    if (place_meeting(x + hsp, y, other.id) || place_meeting(x + sign(hsp), y, other.id))
    {
        with (other.id)
            instance_destroy();
    }
}
