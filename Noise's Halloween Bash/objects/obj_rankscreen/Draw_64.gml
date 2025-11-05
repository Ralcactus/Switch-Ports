draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1);
var _yoff = (get_game_height() - 540) / 2;
draw_sprite(bg_rank, 0, get_game_width() / 2, get_game_height() / 2);
draw_sprite(audiencespr, audienceind, get_game_width() / 2, get_game_height() / 2);
var _signshake = irandom_range(-signshake, signshake);
draw_sprite(spr_ranktotals, 0, 192 + _signshake, totalsigny);
draw_set_font(global.rankcountfont);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
__draw_text_hook(174 + irandom_range(-scoreshake, scoreshake) + _signshake, totalsigny + 94, floor(scorecount));
__draw_text_hook(231 + irandom_range(-pumpkinshake, pumpkinshake) + _signshake, totalsigny + 138, string("{0}/10", floor(pumpkincount)));
__draw_text_hook(192 + irandom_range(-crateshake, crateshake) + _signshake, totalsigny + 181, string("{0}/{1}", global.cratecount - crateshit, global.cratecount));

with (obj_drawcontroller)
    event_user(0);

for (var i = 1; i <= 3; i++)
{
    if (bit_get(gemcount, i))
        draw_sprite(spr_ranktotals, i, 192 + _signshake, totalsigny);
    else if (curgem >= i)
        draw_sprite(spr_ranktotals, i + 3, 192 + _signshake, totalsigny);
}

var _signshake2 = irandom_range(-1, 1);
draw_sprite(spr_ranksign, 0, (get_game_width() - 192) + (_signshake2 * (ranksigny < 0)), ranksigny);
var _signind = 0;

switch (rank)
{
    case Rank.Shit:
        _signind = 1;
        break;
    
    case Rank.Meh:
        _signind = 2;
        break;
    
    case Rank.Good:
        _signind = 3;
        break;
    
    case Rank.Perfect:
        _signind = 4;
        break;
}

draw_sprite(spr_ranksign, _signind, (get_game_width() - 192) + (_signshake2 * (ranksigny < 0)), ranksigny);
pal_swap_set(obj_player.palettespr, obj_player.curpalette, false);
draw_sprite(noisespr, noiseind, get_game_width() / 2, _yoff + 357);
shader_set(shd_premultiply);

if (fade > 0)
    draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_white, fade);
