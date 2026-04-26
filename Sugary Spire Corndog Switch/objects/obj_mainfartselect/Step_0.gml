scr_getinput();

if (abletomove)
{
    if (keyboard_check_pressed(vk_f2))
    {
        if (!instance_exists(obj_bestiary))
        {
            instance_create(0, 0, obj_bestiary);
            abletomove = false;
        }
    }
    
    if (-key_left2 && selected < 2)
    {
        event_play_oneshot("event:/SFX/ui/step");
        selected++;
    }
    
    if (key_right2 && selected > 0)
    {
        event_play_oneshot("event:/SFX/ui/step");
        selected--;
    }
    
    if (key_jump && selected == 0 && obj_file1.sprite_index != spr_file1confirm)
    {
        event_play_oneshot("event:/SFX/general/collecttoppin");
        abletomove = false;
        obj_file1.image_index = 0;
        obj_file1.sprite_index = spr_file1confirm;
    }
    
    if (key_jump && selected == 1 && !instance_exists(obj_Options_Main))
    {
        event_play_oneshot("event:/SFX/general/collecttoppin");
        abletomove = false;
        instance_create(0, 0, obj_Options_Main);
    }
    
    if (key_jump && selected == 2 && !instance_exists(obj_erasefile))
    {
        event_play_oneshot("event:/SFX/general/collecttoppin");
        abletomove = false;
        instance_create(0, 0, obj_erasefile);
    }
}

var justfarded = 0;

switch (selected)
{
    case 0:
        justfarded = 96;
        _message = "PLAY GAME";
        break;
    
    case 1:
        justfarded = 480;
        _message = "OPTIONS";
        break;
    
    case 2:
        justfarded = 828;
        _message = "ERASE SAVE FILE";
        break;
}

lightX = lerp(lightX, justfarded, 0.2);
var asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA");
layer_sprite_index(asset, selected);

if (showtext == 1)
    yi = approach(yi, 490, 5);

xi = 480 + random_range(1, -1);
