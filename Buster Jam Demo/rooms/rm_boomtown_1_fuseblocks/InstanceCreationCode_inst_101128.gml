answer = [1, 0, 2];

event_completed = function()
{
    with (obj_map_player)
        deac = true;
    
    instance_create_layer(0, 0, layer, obj_cutscene_puzzle_fuseblock);
};
