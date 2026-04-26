sprite_index = spr_iceblock;

if (global.freezeframe)
{
    vsp = 0;
    exit;
}

if (baddieInvincibilityBuffer > 0)
    baddieInvincibilityBuffer--;

switch (state)
{
    default:
        hsp = 0;
        vsp = 0;
        var p = get_nearestPlayer();
        
        if (p.sprite_index != p.spr_machslideboost3)
        {
            baddieOnPlayerCollisions();
            
            if (obj_camera.NextFreeze && value == -4)
            {
                var hspPCT = abs(p.hsp) / 16;
                value = clamp(floor(lerp(1, 6, hspPCT)), 1, 6);
            }
        }
        
        break;
    
    case UnknownEnum.Value_4:
        instance_destroy();
        ds_list_add(global.SaveRoom, id);
        var _c = value * 50;
        global.Collect += _c;
        global.PokerChips += _c;
        break;
}
