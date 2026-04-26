if (sprite_index != spr_honeyslime_jump && sprite_index != spr_honeyslime_fall && sprite_index != spr_honeyslime_form && ((obj_parent_player.x > (x - 400) && obj_parent_player.x < (x + 400)) && (y <= (obj_parent_player.y + 500) && y >= (obj_parent_player.y - 500))) && obj_parent_player.state != UnknownEnum.Value_87 && obj_parent_player.state != UnknownEnum.Value_96 && obj_parent_player.state != UnknownEnum.Value_72 && obj_parent_player.state != UnknownEnum.Value_97)
    sprite_index = spr_honeyslime_jump;

if (sprite_index == spr_honeyslime_jump && animation_end())
{
    image_index = 0;
    dropping = true;
}

if (dropping)
{
    y += 10;
    accel += 0.1;
    sprite_index = spr_honeyslime_fall;
}

if (place_meeting(x, y, obj_solid) && dropping)
{
    sprite_index = spr_honeyslime_form;
    dropping = false;
}

if (sprite_index == spr_honeyslime_form && animation_end() && visible)
{
    image_speed = 0;
    visible = false;
    
    with (instance_create(x, y - 50, obj_honeyslime))
        dropid = other.id;
}
