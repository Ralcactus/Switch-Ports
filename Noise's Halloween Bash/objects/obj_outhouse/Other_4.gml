var _arr = obj_levelmap.roominfo_outhouses;

for (var _i = 0; _i < array_length(_arr); _i++)
{
    var _struct = _arr[_i];
    
    if (_struct.room == real(room) && _struct.id == real(id) && _struct.x == x && _struct.y == y)
    {
        found = true;
        break;
    }
}
