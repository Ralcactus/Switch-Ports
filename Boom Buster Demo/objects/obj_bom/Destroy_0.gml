if (carried != -4)
{
    with (carried)
        ds_list_delete(list_carry, ds_list_find_index(list_carry, other.id));
}
