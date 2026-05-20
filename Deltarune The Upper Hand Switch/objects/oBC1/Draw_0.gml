ty++;
j6 = 1.25;

if (!(ty % 30))
{
    if (j1 == 0)
    {
        j3 = 0;
        j4 = 0;
    }
    
    if (j1 == 1)
    {
        j3 = 32;
        j4 = 8;
    }
    
    if (j1 == 2)
    {
        j3 = 62;
        j4 = 16;
    }
    
    array_push(i1, [j3, j4, 0, irandom_range(0, 90) * 4, 0, 1, irandom_range(5, 10) / 100]);
    j1++;
    
    if (j1 >= 3)
        j1 = 0;
}

if (!(ty % 40))
{
    if (j2 == 0)
    {
        j3 = 140;
        j4 = 16;
    }
    
    if (j2 == 1)
    {
        j3 = 166;
        j4 = -6;
    }
    
    array_push(i1, [j3, j4, 0, irandom_range(0, 90) * 4, 0, 1, irandom_range(5, 10) / 100]);
    j2++;
    
    if (j2 >= 2)
        j2 = 0;
}

i = 1.5;
walk1 -= 0.5;

if (walk1 <= -640)
    walk1 = 0;

walk2 += 1.5;

if (walk1 >= 640)
    walk2 = 0;

draw_sprite_tiled_ext(sBC1, 4, walk1 + ((op.camX + op.cameX) / i), (op.camY + op.cameY) / (1 * j6), 2, 2, c_white, 1);
draw_sprite_tiled_ext(sBC1, 2, (op.camX + op.cameX) / i, (op.camY + op.cameY) / (1 * j6), 2, 2, c_white, 1);
draw_sprite_tiled_ext(sBC1, 3, walk2 + ((op.camX + op.cameX) / i), (op.camY + op.cameY) / (1 * j6), 2, 2, c_white, 1);
i += 0.5;
draw_sprite_tiled_ext(sBC3, 0, (op.camX + op.cameX) / i, (op.camY + op.cameY) / (1 * j6), 2, 2, c_white, 1);
i += 0.5;
j = 0;

repeat (array_length(i1))
{
    i1[j][0] += (-1 + dsin(i1[j][3] + (op.ty * 3)));
    i1[j][1] -= 3;
    
    if (i1[j][2] != 1)
        i1[j][2] += 0.1;
    
    i1[j][5] += i1[j][6];
    
    if (i1[j][5] >= 4)
        i1[j][5] = 1;
    
    i1[j][4] += 0.01;
    draw_sprite_tiled_ext(sBC2, i1[j][5], i1[j][0] + ((op.camX + op.cameX) / i), i1[j][1] + ((op.camY + op.cameY + 15) / j6), 2 + i1[j][4], 2 + i1[j][4], c_white, i1[j][2]);
    j++;
}

j = array_length(i1) - 1;

repeat (array_length(i1))
{
    if (i1[j][1] < -300)
        array_delete(i1, j, 1);
    
    j--;
}

draw_sprite_tiled_ext(sBC2, 0, 1 + ((op.camX + op.cameX) / i), (op.camY + op.cameY) / j6, 2, 2, c_white, 1);
i += 0.5;

if (statue)
    draw_sprite_tiled_ext(sBC1, 1, -10 + ((op.camX + op.cameX) / i), (op.camY + op.cameY) / j6, 2, 2, c_white, 1);

i += 0.5;
ext(sBC1, 5, 0, -480 + ((op.camY + op.cameY) / j6), 20, 2, 0, 16777215, 1);
