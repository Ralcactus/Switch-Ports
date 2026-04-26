scr_tvsprites();

if (!visible)
    sprite_index = spr_tvoff;

var player_object = obj_player1;

if (!(player_object.state == UnknownEnum.Value_17 && player_object.state == UnknownEnum.Value_18 && player_object.state == UnknownEnum.Value_13))
    once = 0;

if (player_object.y < (180 + obj_camera.Cam_y) && player_object.x > ((camera_get_view_width(view_camera[0]) - 350) + obj_camera.Cam_x))
{
    DrawY = lerp(DrawY, -300, 0.15);
    alpha = 0.5;
}
else
{
    DrawY = lerp(DrawY, 0, 0.15);
    alpha = 1;
}

if (global.hurtcounter >= global.hurtmilestone && global.hurtcounter >= 5)
{
    showtext = 1;
    alarm[0] = 150;
    
    if (player_object.character == UnknownEnum.Value_0)
        character = "Pizzelle";
    else
        character = "Pizzano";
    
    scr_controlprompt("[spr_promptfont]You have hurt " + string(character) + " " + string(global.hurtmilestone) + " times...", -4, 150);
    randomise();
    scr_queue_tvanim(choose(spr_pizzytv_escape4, spr_pizzytv_escape5, spr_pizzytv_escape6, spr_pizzytvhurtext1), 150);
    global.hurtmilestone += 5;
}

if (staticdraw)
    statictimer--;

if (statictimer < 0)
    staticdraw = false;

var allstate = global.freezeframe ? player_object.frozenState : player_object.state;

switch (state)
{
    case UnknownEnum.Value_1:
        if (!instance_exists(obj_secretfound))
        {
            tvidlespr = idletvspr;
            
            if (player_object.angry)
                tvidlespr = angrytvspr;
            
            if (global.panic)
                tvidlespr = panictvspr;
        }
        else
        {
            tvidlespr = secrettvspr;
        }
        
        var _transfo = true;
        
        switch (allstate)
        {
            default:
                _transfo = false;
                break;
            
            case UnknownEnum.Value_63:
            case UnknownEnum.Value_64:
            case UnknownEnum.Value_16:
            case UnknownEnum.Value_66:
            case UnknownEnum.Value_11:
            case UnknownEnum.Value_28:
            case UnknownEnum.Value_62:
            case UnknownEnum.Value_65:
                _transfo = false;
                var my_mvsp = global.freezeframe ? abs(player_object.frozenHsp) : abs(player_object.hsp);
                
                if (allstate == UnknownEnum.Value_11)
                    my_mvsp = global.freezeframe ? abs(player_object.frozenVsp) : abs(player_object.vsp);
                
                tvidlespr = mach1tvspr;
                
                if (my_mvsp >= 8 || allstate == UnknownEnum.Value_16)
                    tvidlespr = mach2tvspr;
                
                if (my_mvsp >= 12 || allstate == UnknownEnum.Value_65)
                    tvidlespr = mach3tvspr;
                
                if (my_mvsp >= 20 || player_object.sprite_index == player_object.spr_crazyrun)
                    tvidlespr = mach4tvspr;
                
                if (allstate == UnknownEnum.Value_16 || allstate == UnknownEnum.Value_62)
                    tvidlespr = mach1tvspr;
                
                if (allstate == UnknownEnum.Value_28)
                    tvidlespr = machrolltvspr;
                
                break;
            
            case UnknownEnum.Value_50:
            case UnknownEnum.Value_70:
            case UnknownEnum.Value_67:
                _transfo = false;
                
                if (ds_list_size(obj_camera.cameraShakeList) > 0)
                    tvidlespr = crashtvspr;
                
                break;
            
            case UnknownEnum.Value_95:
                tvidlespr = tumbletvspr;
                break;
            
            case UnknownEnum.Value_20:
                tvidlespr = bombtvspr;
                break;
            
            case UnknownEnum.Value_132:
                tvidlespr = hooktvspr;
                break;
            
            case UnknownEnum.Value_100:
                tvidlespr = minecarttvspr;
                break;
            
            case UnknownEnum.Value_107:
            case UnknownEnum.Value_108:
                tvidlespr = firetvspr;
                break;
            
            case UnknownEnum.Value_87:
            case UnknownEnum.Value_96:
            case UnknownEnum.Value_97:
                tvidlespr = cottontvspr;
                break;
            
            case UnknownEnum.Value_152:
            case UnknownEnum.Value_150:
            case UnknownEnum.Value_151:
            case UnknownEnum.Value_153:
                tvidlespr = frostburntvspr;
                break;
            
            case UnknownEnum.Value_98:
                tvidlespr = orbtvspr;
                break;
            
            case UnknownEnum.Value_45:
            case UnknownEnum.Value_47:
                tvidlespr = ufotvspr;
                break;
            
            case UnknownEnum.Value_78:
            case UnknownEnum.Value_79:
                tvidlespr = marshdogspr;
                break;
        }
        
        if (!_transfo)
        {
            if (allstate == UnknownEnum.Value_68)
                scr_queue_tvanim(hurttvspr, 60);
            
            if ((global.Combo % 3) == 0 && playComboVariable != global.Combo && global.ComboTime > 0 && global.Combo > 0)
            {
                scr_queue_tvanim(combotvspr, 250);
                playComboVariable = global.Combo;
            }
        }
        
        switch (sprite_index)
        {
            case spr_tvoff:
                if (visible)
                {
                    sprite_index = spr_tvturnon;
                    image_index = 0;
                }
                
                break;
            
            case spr_tvturnon:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idletvspr;
                
                break;
            
            case idletvspr:
                idleAnim--;
                
                if (idleAnim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(tvchange1, tvchange2);
                    image_index = 0;
                }
                
                break;
            
            case tvchange1:
            case tvchange2:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = tvidlespr;
                    idleAnim = choose(500, 450, 400, 550);
                }
                
                break;
            
            default:
                sprite_index = tvidlespr;
                break;
        }
        
        break;
    
    case UnknownEnum.Value_157:
        draw_static = true;
        saved_tv_spr = tvidlespr;
        
        if (floor(static_index) >= 4)
        {
            if (expressionsprite != -4)
            {
                state = UnknownEnum.Value_158;
                sprite_index = expressionsprite;
            }
            else
            {
                state = UnknownEnum.Value_1;
                sprite_index = saved_tv_spr;
            }
            
            image_index = 0;
            draw_static = 0;
        }
        
        break;
    
    case UnknownEnum.Value_158:
        switch (expressionsprite)
        {
            case hurttvspr:
                if (allstate != UnknownEnum.Value_68)
                    expressiontime--;
                
                break;
            
            default:
                expressiontime--;
                break;
        }
        
        if (expressiontime <= 0)
        {
            state = UnknownEnum.Value_157;
            expressionsprite = -4;
            draw_static = true;
            static_index = 0;
        }
        
        break;
}

if (textbubblesprites == spr_tv_bubbleopen && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleopen) - 1))
    textbubblesprites = spr_tv_bubble;

if (textbubblesprites == spr_tv_bubble)
    text_x += -3;

if (textbubblesprites == spr_tv_bubbleclose && floor(textbubbleframes) >= (sprite_get_number(spr_tv_bubbleclose) - 1))
{
    new_message = "";
    shownewtext = false;
    showingnewtext = false;
    textbubbleframes = 0;
    text_x = 300;
}

switch (player_object.state)
{
    case UnknownEnum.Value_87:
    case UnknownEnum.Value_96:
    case UnknownEnum.Value_97:
        if (ds_list_find_index(global.SaveRoom, "cotton") == -1)
        {
            scr_queue_message("Mmmph!! MMMPH!! MMPPH! (This cotton is quite a delicacy, isn't it?)");
            ds_list_add(global.SaveRoom, "cotton");
        }
        
        break;
    
    case UnknownEnum.Value_100:
        if (ds_list_find_index(global.SaveRoom, "minecart") == -1)
        {
            scr_queue_message("Easy... easy... hold on to your hats... hard hats, rather.");
            ds_list_add(global.SaveRoom, "minecart");
        }
        
        break;
    
    case UnknownEnum.Value_107:
        if (ds_list_find_index(global.SaveRoom, "fireass") == -1)
        {
            scr_queue_message("Breaking news... local candy maker finds himself burned by caramel.");
            scr_queue_message("What an idiot. How does that even happen?");
            ds_list_add(global.SaveRoom, "fireass");
        }
        
        break;
    
    case UnknownEnum.Value_98:
        if (ds_list_find_index(global.SaveRoom, "fling") == -1)
        {
            scr_queue_message("Aughh!! What kind of black magic has this flying frog casted upon me?! Feels kinda nice.");
            ds_list_add(global.SaveRoom, "fling");
        }
        
        break;
    
    case UnknownEnum.Value_130:
        if (ds_list_find_index(global.SaveRoom, "flushed") == -1)
        {
            scr_queue_message("Incredibly cold temperatures are causing random individuals to be frozen solid. We recommend you stay inside during these chilly times.");
            ds_list_add(global.SaveRoom, "flushed");
        }
        
        break;
}

propindex += 0.5;
statindex += 0.3;
var fillamt = global.fill;
var timeinsecs = floor(fillamt / 60);
var secs = max(timeinsecs % 60, 0);
goo_index += 0.22;

if (goo_index >= (sprite_get_number(spr_combometer_goo) - 1))
    goo_index = frac(goo_index);

if (global.panic)
{
    if (global.fill > 0)
    {
        var _spd = (1 - (fillamt / global.maxwave)) * sprite_get_number(spr_bartimer_roll) * 10;
        roll_index = _spd % sprite_get_number(spr_bartimer_roll);
        oldTimer_index = secs % 2;
        coneball_index += 0.35;
        oldBall_index += 0.35;
        
        if (coneball_index >= sprite_get_number(coneball_sprite))
            coneball_index = frac(coneball_index);
        
        if (oldBall_index >= sprite_get_number(oldBall_sprite))
            oldBall_index = frac(oldBall_index);
        
        if (roll_index >= sprite_get_number(roll_sprite))
            roll_index = frac(roll_index);
        
        if (!get_panic())
            timer_y = approach(timer_y, 150, 4);
        else if (timer_in <= 0)
            timer_y = approach(timer_y, 0, 1);
    }
    else
    {
        if (oldBall_sprite == spr_timer_coneball_idle)
        {
            oldBall_sprite = spr_timer_coneball;
            oldBall_index = 0;
        }
        
        if (coneball_sprite == spr_bartimer_normalFront)
        {
            coneball_sprite = spr_bartimer_showtime;
            coneball_index = 0;
        }
        
        if (coneball_index < (sprite_get_number(coneball_sprite) - 1))
            coneball_index += 0.35;
        
        if (oldBall_index < (sprite_get_number(oldBall_sprite) - 1))
            oldBall_index += 0.35;
        
        if (oldTimer_index < (sprite_get_number(oldTimer_sprite) - 1))
            oldTimer_index += 0.35;
        
        if (timer_out > 0)
            timer_out--;
        else
            timer_y = approach(timer_y, 150, 1);
    }
    
    if (timer_in > 0)
        timer_in--;
}
else
{
    timer_y = 150;
    timer_out = 220;
    timer_in = 60;
    oldTimer_sprite = spr_timer;
    oldBall_sprite = spr_timer_coneball_idle;
    coneball_sprite = spr_bartimer_normalFront;
}

var tgtY = 1 - (global.ComboTime / 60);

if (global.Combo == 0)
    tgtY = 1;

hand_y = lerp(hand_y, 54 * tgtY, 0.3);

if (global.Combo != 0 && global.ComboTime > 0)
{
    switch (combo_state)
    {
        case UnknownEnum.Value_112:
            combo_vsp++;
            combo_y = approach(combo_y, 40, combo_vsp);
            
            if (combo_y >= 40)
                combo_state = UnknownEnum.Value_1;
            
            break;
        
        case UnknownEnum.Value_1:
            var _shk = 2;
            var _t = 5;
            
            if (global.ComboTime < 30)
            {
                _shk = 3;
                _t = 1.1;
            }
            
            if (global.ComboTime < 15)
            {
                _shk = 2;
                _t = 0.15;
            }
            
            combo_y = lerp(combo_y, wave(-2, 2, 8, 3), 0.05);
            combo_x = wave(-_shk, _shk, _t, 5);
            break;
    }
    
    hand_x = approach(hand_x, combo_x, 8);
}
else
{
    combo_y = approach(combo_y, -200, 5);
    hand_x = approach(hand_x, 308, 8);
    combo_vsp = 0;
    combo_state = UnknownEnum.Value_112;
}

if (prompt_timer > 0 && !promptappear)
{
    promptalpha = approach(promptalpha, 1, 0.05);
    prompt_timer--;
}
else if (promptappear || prompt_timer <= 0)
{
    promptalpha = approach(promptalpha, 0, 0.05);
    
    if (promptalpha <= 0)
    {
        controlprompt = nexttext;
        promptappear = false;
    }
}
