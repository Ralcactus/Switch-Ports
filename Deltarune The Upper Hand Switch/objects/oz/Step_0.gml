var _t = -4;
_t = instance_place(x, y, oInteract);

if (_t != -4)
{
    if (_t.func != -1)
    {
        _t.func();
        _t.picked = 1;
    }
}

des();
