x += ex[0];
ex[0] += ex[1];
y += ey[0];
ey[0] += ey[1];

if (x > (room_width + 100) || x < -100 || y > (room_height + 100) || y < -100)
    instance_destroy();

if (place_meeting(x, y, oDodgeSoul))
{
    if (oPlayer.dodgeFrames == 0)
    {
        oPlayer.dodgeFrames = 35;
        op.hurtPoints++;
        screenShake(3, 3);
        popText("14", oPlayer.x, oPlayer.y, sPopWhite, 16777215);
        snd(snd_hurt1);
    }
}

image_angle += rot;
