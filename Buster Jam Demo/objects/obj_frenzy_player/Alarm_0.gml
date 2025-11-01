if (char == 0)
{
    anim_idle = spr_map_buster_idle;
    anim_win = spr_map_buster_thumbsup;
    anim_lose = spr_map_buster_charred;
    anim_throw = spr_map_buster_throw;
    anim_aim = spr_map_buster_aim;
    anim_aim_beat = spr_map_buster_aim_beat;
    anim_spin = spr_map_buster_spin;
    anim_bom_aim = spr_map_bom_orange_aim;
    anim_bom_beat = spr_map_bom_orange_aim_beat;
    anim_bom_throw = spr_map_bom_orange_throw;
    anim_got_bom = spr_map_buster_got_bom;
    mult = 0.84;
}
else if (char == 1)
{
    anim_idle = spr_map_bridget_idle;
    anim_win = spr_map_bridget_peacesign;
    anim_lose = spr_map_bridget_charred;
    anim_throw = spr_map_bridget_throw;
    anim_aim = spr_map_bridget_aim;
    anim_aim_beat = spr_map_bridget_aim_beat;
    anim_spin = spr_map_bridget_spin;
    anim_bom_aim = spr_map_bom_turq_aim;
    anim_bom_beat = spr_map_bom_turq_aim_beat;
    anim_bom_throw = spr_map_bom_turq_throw;
    anim_got_bom = spr_map_bridget_got_bom;
    mult = 1;
}

anim_play(anim_idle);
