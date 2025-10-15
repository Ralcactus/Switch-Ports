var _x = savedx
var _y = savedy
while (_x > (960 - 100))
    _x -= 20
while (_y > (540 - 100))
    _y -= 20
while (_x < 100)
    _x += 20
while (_y < 100)
    _y += 20
show_debug_message(string("Spawning obj_shakeanddie: ({0}, {1})", _x, _y))
with (instance_create(_x, _y, obj_shakeanddie))
    sprite_index = spr_garpo_dead
scr_soundeffect(sfx_groundpound)
scr_soundeffect(sfx_explosion)
