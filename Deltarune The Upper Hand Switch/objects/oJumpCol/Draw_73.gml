i = 1;
i2 = [playerXY[0], playerXY[1] - 35];
i1[0] = playerXY[0];
i1[1] = playerXY[1] - 35;
i1[0] += ((targetXY[0] - playerXY[0]) / j1) * i;
i1[1] += ((targetXY[1] - (playerXY[1] - 35)) / j1) * i;
i1[1] -= dsin((360 / (j1 * 2)) * i) * sinmod;
ext(sRedArrow, 0, playerXY[0] + ((i1[0] - i2[0]) / 1), i2[1], 1, 1, point_direction(i2[0], i2[1], i1[0], i1[1]), undefined, alpha);
