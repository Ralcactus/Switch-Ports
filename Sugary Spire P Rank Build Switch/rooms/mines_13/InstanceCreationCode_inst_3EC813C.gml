condition = function()
{
    return (inst_2A1702B4).has_won;
};

output = function()
{
    with (inst_AB9F350)
        instance_destroy();
    
    instance_create(2240, 576, obj_checkpoint_invis);
};
