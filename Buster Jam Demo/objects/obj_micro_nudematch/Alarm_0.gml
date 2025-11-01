controller.win = false;

with (controller)
    event_set_time(16, true);

var _head = instance_find_micro(obj_micro_nudematch_head);
var _reference = instance_find_micro(obj_micro_nudematch_head_reference);
var _spr = [spr_micro_nudematch_eyes, spr_micro_nudematch_noses, spr_micro_nudematch_mouths];

for (var i = 0; i < 3; i++)
{
    var _max = sprite_get_number(_spr[i]) - 1;
    _reference.index[i] = irandom_range(0, _max);
    _head.index[i] = irandom_range(0, _max);
    
    if (_head.index[i] == _reference.index[i])
    {
        _head.index[i]++;
        
        if (_head.index[i] > _max)
            _head.index[i] = 0;
    }
}

if (controller.fun != undefined)
    _reference.image_index = controller.fun;
else
    _reference.image_index = choose(0, 1);

_head.image_index = _reference.image_index;
ready = true;
