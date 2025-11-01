var _array = [];

with (obj_micro_cratememory_crate)
{
    if (ID == other.ID)
        array_push(_array, id);
}

var _sort = function(arg0, arg1)
{
    return arg0.x - arg1.x;
};

array_sort(_array, _sort);
_inst = _array[smash];

with (_inst)
{
    if (ID == other.ID)
        event_user(0);
}

if (controller.timer[0] >= (60 * time_bpm_to_seconds(140) * 3))
{
    with (controller)
        event_round_time(3);
}
