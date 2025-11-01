function scr_player_actions_init()
{
    climb_spd = 4.5;
    climb_down_spd = 8;
    state_free = 0;
    state_climb = 1;
    state_grind = 2;
    state = state_free;
    hurt = false;
    invulnerable = false;
    invulnerable_flash = 0;
    invulnerable_length = 120;
    grind_dir = -1;
    spun = false;
    coyote_spin = 0;
    action_free = 0;
    action_spin = 1;
    action = action_free;
    timer[0] = -1;
    
    timer_func[0] = function()
    {
        action = action_free;
    };
    
    blink = false;
    timer[1] = -1;
    
    timer_func[1] = function()
    {
        var _blink = blink;
        
        if (_blink)
        {
            blink = false;
            var _double = irandom_range(1, 10);
            
            if (_double >= 8)
                timer[1] = 6;
        }
        else
        {
            blink = true;
            timer[1] = 6;
        }
    };
    
    timer_become_vulnerable = 2;
    timer[timer_become_vulnerable] = -1;
    
    timer_func[timer_become_vulnerable] = function()
    {
        invulnerable = false;
        invulnerable_flash = 0;
        timer[timer_invulnerable_flash] = -1;
    };
    
    timer_invulnerable_flash = 3;
    invulnerable_flash_length = 8;
    timer[timer_invulnerable_flash] = -1;
    
    timer_func[timer_invulnerable_flash] = function()
    {
        invulnerable_flash = !invulnerable_flash;
        timer[timer_invulnerable_flash] = invulnerable_flash_length;
    };
    
    event_hurt = function()
    {
        if (invulnerable)
            exit;
        
        var _inst = instance_create_layer(x, y, layer, obj_player_hurt);
        _inst.my_player = id;
        _inst.facing = facing;
        _inst.z = z;
        hurt = true;
        invulnerable = true;
    };
    
    func_find_crates_destroy = function()
    {
        mask_index = spr_player_mask_3d_spin;
        
        if (instance_place_3d(x, y, z, obj_map_crate) && coyote_spin)
        {
            var _crates = instance_place_array_3d(x + sign(facing), y, z, obj_map_crate);
            
            for (var i = 0; i < array_length(_crates); i++)
            {
                with (_crates[i])
                    event_user(0);
            }
        }
        
        mask_index = spr_player_mask_3d;
    };
    
    auto = false;
}
