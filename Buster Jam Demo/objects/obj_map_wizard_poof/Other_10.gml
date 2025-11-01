if (act_wizard == -4)
{
    print("'act_wizard' not set for 'obj_map_wizard_poof'");
    exit;
}

var _act = act_wizard;

with (obj_map_actor)
{
    if (ID == _act)
        other.my_actor = id;
}

if (my_actor)
{
    x = my_actor.x;
    y = my_actor.y;
}
else
{
    print("could not find wizard actor");
}
