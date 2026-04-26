function state_player_victory()
{
    hsp = 0;
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = true;
    
    if (place_meeting(x, y, obj_parent_door))
        sprite_index = spr_victory;
    
    if (animation_end() && !place_meeting(x, y, obj_startgate) && room != rm_titlecard)
    {
        if (sprite_index == spr_victory)
        {
            if (!instance_exists(obj_fadeoutTransition))
            {
                event_play_oneshot("event:/SFX/general/door");
                instance_create(x, y, obj_fadeoutTransition);
            }
        }
        else
        {
            if (!instance_exists(obj_fadeoutTransition))
                instance_create(x, y, obj_fadeoutTransition);
            
            obj_tv.tvsprite = spr_tvturnon;
            obj_tv.image_index = 0;
        }
    }
    
    if (place_meeting(x, y, obj_startgate))
    {
        sprite_index = spr_entergate;
        
        with (instance_place(x, y, obj_startgate))
        {
            other.x = approach(other.x, x, 5);
            other.y = approach(other.y, bbox_bottom - (other.bbox_bottom - other.y), 5);
        }
    }
    
    image_speed = (floor(image_index) == (image_number - 1)) ? 0 : 0.35;
    
    if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
    {
        with (instance_place(x, y, obj_parent_door))
            other.x = approach(other.x, (x - sprite_xoffset) + (sprite_width / 2), 2);
    }
    
    global.ComboFreeze = 30;
    global.ComboTime = 60;
}
