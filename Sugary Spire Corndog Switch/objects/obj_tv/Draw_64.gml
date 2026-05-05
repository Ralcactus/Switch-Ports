if (is_hub() || !scr_roomcheck() || room == souractive_tutorial || room == mineshaft_elevator || room == rm_poker)
    exit;

bobbing = 0;
draw_set_font(global.combofont);
draw_set_halign(fa_center);
var last_valign = draw_get_valign();
draw_set_color(c_white);
var _cx = 652;
var _hy = 108 + combo_y + hand_y;
_hy = clamp(_hy, 108, 162);

if (!surface_exists(goo_surface))
{
    goo_surface = surface_create(100, 180);
    surface_set_target(goo_surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
else
{
    surface_set_target(goo_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite(spr_combometer_goo, goo_index, -3, _hy - 14);
    draw_set_blend_mode(bm_subtract);
    draw_sprite(spr_combometer_cut, 0, 0, 0);
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface(goo_surface, (_cx + combo_x) - 50, (108 + combo_y) - 91);
}

draw_sprite_ext(spr_combometer, -1, _cx + combo_x, 108 + combo_y, 1, 1, 0, c_white, alpha);

if (hand_x != 308)
    draw_sprite_ext(spr_combometer_hand, -1, _cx + hand_x, _hy, 1, 1, 0, c_white, alpha);

var _ct = string(global.Combo) + "x";
draw_text(_cx + combo_x + 23, combo_y + 45, _ct);
draw_set_valign(last_valign);
draw_sprite_ext(tvbg, current_bg, 819, 83 + DrawY + bobbing, 1, 1, 0, c_white, 1);

if (sprite_index != spr_tvturnon)
    draw_sprite_ext(draw_static ? spr_tvpropellerstatic : spr_tvpropeller, propindex, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);

draw_player_sprite_ext(sprite_index, image_index, 832, 74 + DrawY + bobbing, 1, 1, 0, 16777215, 1);

if (draw_static)
{
    static_index += 0.3;
    draw_sprite_ext(spr_tv_newstatic, static_index, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);
}

if (tvsprite != spr_tvoff && tvsprite != spr_tvturnon && global.dialogueVolume <= 0)
    draw_sprite_ext(spr_tvmuteicon, 0, 832, 74 + DrawY + bobbing, 1, 1, 0, c_white, 1);

draw_set_font(global.promptfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(global.promptfont);
draw_set_halign(fa_center);
draw_set_color(c_white);
var timerx = 480;
var timery = 490 + timer_y;
var minsx = timerx - 90;
var secx = timerx - 10;
var minsy = timery - 15;
var fillamt = global.fill;
var perc = clamp(1 - (fillamt / global.maxwave), 0, 1);
var john_ypos = -12 * perc;
var dist = clamp(perc * 268, 0, 268);
var timeinsecs = floor(target_fill / 60);
var mins = max(floor(timeinsecs / 60), 0);
var secs = max(timeinsecs % 60, 0);

if (global.panic == 1 || global.StarMode)
{
    if (!sucroseTimer)
        target_fill = lerp(target_fill, global.fill, 0.03);
    else
        target_fill = approach(target_fill, global.fill, 10);
    
    var gaining_time = global.fill > target_fill;
    var display_mins = string(abs(mins));
    var display_secs = string(abs(secs));
    
    if (secs < 10)
        display_secs = "0" + display_secs;
    
    if (!sucroseTimer)
    {
        if (coneball_sprite != spr_bartimer_showtime)
        {
            draw_sprite_ext(spr_bartimer_normalBack, coneball_index, timerx, timery, 1, 1, 0, c_white, 1);
            draw_sprite_part(spr_bartimer_strip, 0, 0, 0, dist + 45, 113, timerx - 184, timery - 56);
            draw_sprite_ext(spr_bartimer_roll, roll_index, (timerx - 147) + dist, timery + john_ypos + 31, 1, 1, 0, c_white, 1);
        }
        
        draw_sprite_ext(coneball_sprite, floor(coneball_index), timerx, timery, 1, 1, 0, c_white, 1);
        draw_text(timerx, timery - 50, display_mins + ":" + display_secs);
    }
    else
    {
        draw_set_font(global.timerfont);
        draw_set_halign(fa_left);
        var _tmr_spr = oldTimer_sprite;
        
        if (_tmr_spr == spr_timer && gaining_time)
            _tmr_spr = spr_timer_gain;
        
        draw_sprite_ext(oldBall_sprite, oldBall_index, timerx, timery, 1, 1, 0, c_white, 1);
        draw_sprite_ext(_tmr_spr, oldTimer_index, timerx, timery, 1, 1, 0, c_white, 1);
        
        if (mins < 10)
            display_mins = "0" + display_mins;
        
        if (oldTimer_sprite != spr_timer_timesup)
        {
            draw_set_color(gaining_time ? #60D048 : #F80000);
            draw_text(minsx, minsy, display_mins);
            draw_text(secx, minsy + 1, display_secs);
            draw_set_color(c_white);
        }
    }
}

var tgt = -100;
var spd = 2;

if (lap_out > 0)
{
    tgt = 90;
    spd = 2;
    lap_out--;
}

lap_y = approach(lap_y, tgt, spd);
draw_set_halign(fa_center);
draw_set_font(global.lapfont);
var x_shk = random_range(-1, 1);
var y_shk = random_range(-1, 1);

if (global.lapcount > 0)
{
    draw_sprite(spr_lapbg, 0, 480 + x_shk, lap_y + y_shk);
    draw_text(480 + x_shk, lap_y + y_shk, global.lapcount);
}

var promptY;

if (global.panic)
    promptY = 425;
else
    promptY = 500;

draw_set_alpha(promptalpha);
draw_text_scribble(480, promptY, "[fa_middle][shake]" + controlprompt);
draw_set_alpha(1);

draw_set_font(global.promptfont);
draw_set_halign(fa_left);

if (global.levelname == "casino")
    draw_text(50, 200, "POKER CHIPS: " + string(global.PokerChips));

draw_set_font(font_console);

