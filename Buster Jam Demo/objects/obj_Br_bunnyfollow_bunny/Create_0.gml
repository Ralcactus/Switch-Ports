path[0] = ["L", "U", "R", "U", "L", "D"];
path[1] = ["D", "D", "L", "U", "NA", "L", "L"];
path[2] = ["R", "R", "U", "R", "R", "U"];
path[3] = ["L", "L", "U", "NA", "R", "R", "D"];
pth_index = irandom_range(0, array_length(path) - 1);
steps = 0;
timer[0] = 48;

timer_func[0] = function()
{
    if (steps > (array_length(path[pth_index]) - 1))
        steps = 0;
    
    if (path[pth_index][steps] != "NA")
        anim_speed = 1;
    
    if (path[pth_index][steps] != "L" && path[pth_index][steps] != "R")
        facing = 1;
    
    switch (path[pth_index][steps])
    {
        case "U":
            hspd = 0;
            vspd = -spd;
            anim_play(spr_Br_bunnyfollow_bunny_up);
            break;
        
        case "D":
            hspd = 0;
            vspd = spd;
            anim_play(spr_Br_bunnyfollow_bunny_down);
            break;
        
        case "L":
            hspd = -spd;
            vspd = 0;
            anim_play(spr_Br_bunnyfollow_bunny_side);
            facing = 1;
            break;
        
        case "R":
            hspd = spd;
            vspd = 0;
            anim_play(spr_Br_bunnyfollow_bunny_side);
            facing = -1;
            break;
        
        case "NA":
            hspd = 0;
            vspd = 0;
            anim_speed = 0;
            break;
    }
    
    steps++;
    timer[0] = irandom_range(20, 30);
};

hspd = 0;
vspd = 0;
spd = 4.25;
facing = 1;
anim_init();
anim_speed = 0;
alarm[0] = 1;
