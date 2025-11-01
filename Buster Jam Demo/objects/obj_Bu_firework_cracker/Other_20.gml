var _stars = 8;

for (var i = 0; i < _stars; i++)
{
    var _inst = instance_create_layer(obj_Bu_firework_circle.x, obj_Bu_firework_circle.y, "Middle", obj_fakeparticle_microgame);
    _inst.anim_sprite = spr_Bu_firework_sparkle;
    
    _inst.event_animend = function()
    {
    };
    
    _inst.fadeout = true;
    _inst.fade_spd = 0.01;
    _inst.spd_dir = ((360 / _stars) * i) + dir_add;
    _inst.spd = 15;
    _inst.spd_to = 0;
    _inst.ID = ID;
    _inst.controller = controller;
    _inst.bm = 1;
    _inst.image_alpha = 0.8;
    _inst.spd_lag = 35;
}

dir_add += (360 / _stars / 2);
