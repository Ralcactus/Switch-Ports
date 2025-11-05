if (game_paused() || obj_player.state == states.nitrocutscene)
{
    image_index -= image_speed;
    exit;
}

if (instance_exists(obj_player))
    playid = obj_player.id;

if (playid != noone)
{
    if (playid.sprite_index == spr_player_jumppeak || playid.sprite_index == spr_player_jumpend || playid.sprite_index == spr_player_fall || playid.sprite_index == spr_player_crouchjumpend || playid.sprite_index == spr_player_crouchfall || playid.sprite_index == spr_player_fallturn || playid.sprite_index == spr_player_crouchfallturn || playid.sprite_index == spr_player_wallslidecancelup || playid.sprite_index == spr_player_wallslidecanceldown || playid.sprite_index == spr_player_cratebounce || playid.sprite_index == spr_player_crouchfallbunny || playid.sprite_index == spr_player_crouchfallbunnyturn || playid.sprite_index == spr_player_wallrunend)
    {
        if (playid.vsp < 0)
        {
            if (sprite_index != spr_player_capeup && sprite_index != spr_player_capedowntoup)
            {
                sprite_index = spr_player_capedowntoup;
                image_index = 0;
            }
        }
        
        if (playid.vsp > 0)
        {
            if (sprite_index != spr_player_capedown && sprite_index != spr_player_capeuptodown)
            {
                sprite_index = spr_player_capeuptodown;
                image_index = 0;
            }
        }
    }
    else if (playid.grounded)
    {
        sprite_index = spr_player_capeup;
    }
}

if (sprite_index == spr_player_capedowntoup && sprite_animation_end())
{
    sprite_index = spr_player_capeup;
    image_index = 0;
}

if (sprite_index == spr_player_capeuptodown && sprite_animation_end())
{
    sprite_index = spr_player_capedown;
    image_index = 0;
}
