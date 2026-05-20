ext(sprite_index, image_index, x + irandom_range(-shake, shake), y + _y + irandom_range(-shake, shake), 2, 2, undefined, undefined, image_alpha);

if (over)
{
    _y += _yt;
    _yt += 3;
    
    if (round(y + _y) >= 330)
        des();
}
else
{
    _y += ((0 - _y) / 3);
}

if (room != rSoulTutorial)
{
    if (!over && oBUI.stage == 0)
        over = true;
}
