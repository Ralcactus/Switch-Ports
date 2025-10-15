ds_list_add(global.saveroom, id)
global.gerome = 1
scr_soundeffect(Janitorget)
global.combotime = 60
instance_create(x, y, obj_geromefollow)
instance_create(x, y, obj_baddietaunteffect)
instance_destroy()
with (obj_player1)
{
    roomstartx = other.x
    roomstarty = other.y
}
