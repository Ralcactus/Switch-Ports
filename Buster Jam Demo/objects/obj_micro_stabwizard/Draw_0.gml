draw_sprite(spr_wizardstab_bg, 0, 0, 0);
draw_sprite(man_spr, man_ind, 0, 0);

if (bubble_spr != -4)
    draw_sprite(bubble_spr, bubble_ind, 0, 0);

if (lose)
    exit;

draw_sprite(spr_wizardstab_knife, knife_in, 0, 0);
draw_sprite(spr_wizardstab_chars, chars_ind, 0, 0);

if (controller.win)
    exit;

var _spr;

if (knife_in)
    _spr = spr_wizardstab_arrow_left;
else
    _spr = spr_wizardstab_arrow;

draw_sprite(_spr, arrow_ind, 151, 180);
