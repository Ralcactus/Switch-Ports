if (exit_freeze())
    exit;

boms_index += (sprite_get_speed(bom_spr) / 60);

if (boms_index >= sprite_get_number(bom_spr))
    boms_index -= boms_index;

anim_logic();

if (combo_timer)
{
    combo_timer--;
}
else
{
    combo = 0;
    comboScore = 0;
}
