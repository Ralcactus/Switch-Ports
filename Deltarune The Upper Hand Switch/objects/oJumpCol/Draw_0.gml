draw_self();
res_i();
i1 = [];
i2 = [playerXY[0], playerXY[1] - 35];
res_j();
j1 = 10;
j2 = [targetXY[0], targetXY[1]];

if (array_length(visualTarget) > 0)
    j2 = [visualTarget[0], visualTarget[1]];

draw_set_alpha(alpha);

repeat (j1)
{
    i++;
    i1[0] = playerXY[0];
    i1[1] = playerXY[1] - 35;
    i1[0] += ((j2[0] - playerXY[0]) / j1) * i;
    i1[1] += ((j2[1] - (playerXY[1] - 35)) / j1) * i;
    i1[1] -= dsin((360 / (j1 * 2)) * i) * sinmod;
    i3 = 16547719;
    draw_circle_color(i2[0], i2[1], 4, i3, i3, false);
    draw_line_width_color(i2[0], i2[1], i1[0], i1[1], 3, i3, i3);
    i2 = [i1[0], i1[1]];
    
    if (i == j1)
        draw_circle_color(i2[0], i2[1], 6 + (dsin(op.ty * 10) * 2), i3, i3, false);
}

draw_set_alpha(1);
