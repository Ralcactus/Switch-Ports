if (!surface_exists(surfacePallete))
    surfacePallete = surface_create(surfaceWidth, surfaceHeight);

scr_playercolors();
var yoffset = 160;
var _door = obj_parent_doortrigger;

with (obj_parent_doortrigger)
{
    if (other.targetDoor == id_door)
        _door = id;
}

var _down_box;

if (instance_exists(_door))
{
    _down_box = false;
    
    with (_door)
    {
        if (other.box && place_meeting(x, y - 1, obj_boxofpizza))
            _down_box = true;
    }
    
    if (hallway)
        x = _door.x + (_door.sprite_width / 2) + (hallwaydirection * 96);
    else if (vertical)
        x = _door.x + verticalOffset;
    else if (box || secretPortal)
        x = _door.x + 32;
    else
        x = _door.x + 16;
    
    if (vertical)
        y = _door.y + (hallwaydirection * yoffset);
    else if (box && _down_box)
        y = _door.y - 1;
    else
        y = _door.y - 14;
}
else
{
    show_debug_message("Door Trigger Instance not found");
}

if (place_meeting(x, y, obj_exitgate))
{
    with (instance_place(x, y, obj_exitgate))
        other.x = x;
}

with (obj_coneball_timesUp)
{
    x = other.x;
    y = other.y;
    
    if (other.hallway)
        x += (-other.hallwaydirection * 200);
    else if (other.vertical)
        y += (-other.hallwaydirection * 200);
    else
        image_alpha = 0;
}

if ((state == UnknownEnum.Value_72 || state == UnknownEnum.Value_56) && room != rank_room)
{
    state = UnknownEnum.Value_57;
    image_index = 0;
    
    if (box)
    {
        vsp = 0;
        jumpStop = true;
        state = UnknownEnum.Value_61;
        
        if (_down_box)
        {
            state = UnknownEnum.Value_55;
            sprite_index = spr_fall;
        }
    }
}

hallway = false;
box = false;
vertical = false;
secretPortal = false;
roomStartX = x;
roomStartY = y;

if ((!room_exists(targetRoom) && room == rm_missing) || targetRoom == rm_missing)
    show_debug_message("Room \"" + string(targetRoom) + "\" does not exist. Sent Player to \"rm_missing\"");
