wait++;

if (room != rSoulTutorial)
{
    boxX = oBox.x;
    boxY = oBox.y;
    up = (4 + oBox.y) - (oBox.yScl * 6);
    down = -4 + oBox.y + (oBox.yScl * 6);
    left = (4 + oBox.x) - (oBox.xScl * 6);
    right = -4 + oBox.x + (oBox.xScl * 6);
    
    if (wait > 10)
    {
        ty++;
        battlePatterns();
    }
}
