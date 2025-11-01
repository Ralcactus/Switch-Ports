function exit_freeze()
{
    return ds_list_find_index(global.list_ignorefreeze, id) == -1 && (global.freeze || (instance_exists(obj_editor) && obj_editor.edit_mode) || global.goodnight || (instance_exists(obj_paused) && obj_paused.freeze));
}
