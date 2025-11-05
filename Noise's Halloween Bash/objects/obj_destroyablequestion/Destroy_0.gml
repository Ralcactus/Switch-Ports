event_inherited();
scr_fmod_soundeffectONESHOT("event:/sfx/misc/cratedestroy", x + (sprite_width / 2), y + (sprite_height / 2));
crateeffect(#B03000);
var _collecttype = irandom(3);
var _quantity = irandom_range(1, 15);

if (!scr_solid(x, y + 1))
    _collecttype = 3;

if (_collecttype < 3)
{
    repeat (_quantity)
    {
        with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z + 16 + random_range(-3, 3), par_collect))
        {
            image_speed = 0.35;
            value = 1;
            sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
            hasphysics = true;
            vsp = random_range(-2, -4);
            
            if (_quantity > 1)
                hsp = random_range(-5, 5);
            
            collectonland = true;
            saveroom = false;
        }
    }
}
else
{
    with (instance_create_depth(x + (sprite_width / 2), y + (sprite_height / 2), z + 16, par_collect))
    {
        image_speed = 0.35;
        value = _quantity;
        splitfactor = _quantity;
        splittime = 3;
        particlespr = [spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5];
        canmagnetise = false;
        splitsound = "event:/sfx/player/collect";
        saveroom = false;
        event_user(0);
    }
}

combo();
