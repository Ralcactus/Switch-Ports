ready = false;
alarm[0] = 3;
lag = 1;
myclamp[3] = 0;
myclamp[2] = room_width;
myclamp[0] = 0;
myclamp[1] = room_height;

for (var i = 0; i < 4; i++)
{
    myclamp_dir[i] = undefined;
    myclamp_to[i] = myclamp[i];
}

instant = true;
global.cam_follow = id;
