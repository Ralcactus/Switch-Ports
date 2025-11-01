myBox = -4;

with (obj_pipebox_orange)
{
    if (myPipe == other.myPipe)
        other.myBox = id;
}

if (myBox != -4)
{
    boxX = myBox.x;
    boxY = myBox.y;
}
