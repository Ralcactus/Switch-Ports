function state_player_comingoutdoor()
{
    static dark_color = 0;
    
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = true;
    hsp = 0;
    vsp = 0;
    sprite_index = spr_walkfront;
    image_speed = 0.35;
    
    if (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_exitgate) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock))
    {
        dark_color = image_index / image_number;
        image_blend = make_color_hsv(0, 0, dark_color * 255);
    }
    
    if (animation_end())
    {
        movespeed = 0;
        state = UnknownEnum.Value_1;
        image_alpha = 1;
        image_blend = make_color_hsv(0, 0, 255);
    }
    
    global.ComboFreeze = 30;
}
