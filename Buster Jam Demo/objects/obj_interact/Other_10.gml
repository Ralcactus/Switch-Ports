if (!instance_exists(obj_map_player))
    exit;

var _xscale_prev = image_xscale;
var _yscale_prev = image_yscale;
var _width = _xscale_prev * 64;
var _length = _yscale_prev * 64;
image_xscale *= ((_width + 2) / _width);
image_yscale *= ((_length + 2) / _length);
x--;
y--;
var _touching;

with (obj_map_player)
{
    _touching = instance_place_3d(x, y, z, other);
    var _sameZ;
    
    if (obj_map_player.z == other.z || obj_map_player.z == (other.z - 1))
        _sameZ = true;
    else
        _sameZ = false;
    
    if (obj_map_player.deac || !_sameZ || instance_exists(obj_scene_manager) || (instance_exists(obj_map_player_follower) && !obj_map_player_follower.grounded) || obj_map_player.action != obj_map_player.action_free || !obj_map_player.grounded)
        _touching = false;
}

touching = _touching;
x++;
y++;
image_xscale = _xscale_prev;
image_yscale = _yscale_prev;

if (_touching && input_check_pressed("jump"))
    event_interact();

if (instance_exists(my_character))
    my_character.touching = _touching;
