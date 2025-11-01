draw_sprite(anim_sprite, anim_index, x, y + (yoff * 5));

if (anim_sprite == spr_micro_demoswing_man_lose)
{
    draw_sprite(spr_micro_demoswing_questionmark, anim_index, x, y + question_yoff + 100);
    question_yoff = easy_smooth(question_yoff, -150, 10);
}
