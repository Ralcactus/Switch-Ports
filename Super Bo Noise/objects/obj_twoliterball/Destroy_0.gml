if (explodeInstant >= 2)
{
    with (instance_create(x, y, obj_canonexplosion))
        rat = true
}
else
    instance_create(x, y, obj_twoliterexplosion)
scr_soundeffect(sfx_2literexplosion)
