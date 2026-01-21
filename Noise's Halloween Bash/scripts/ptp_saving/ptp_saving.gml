function get_savedir()
{
    if (!directory_exists(game_save_id))
        directory_create(game_save_id);
    
    return "gameSave";
}

function save_open()
{
    ini_open_from_string(obj_savesystem.savestr);
}

function save_close()
{
    obj_savesystem.savestr = ini_close();
}

function get_savestate()
{
    return obj_savesystem.savestate;
}

function save_load()
{
    with (obj_savesystem)
    {
        if (savestate == save_state.idle)
        {
            savestate = save_state.loadsave;
            trace("Loading Save...");
            loadbuff = buffer_create(1, buffer_grow, 1);
            buffer_async_group_begin(get_savedir());
            buffer_load_async(loadbuff, "saveData.save", 0, -1);
            asyncloadid = buffer_async_group_end();
        }
        else
            ds_queue_enqueue(savequeue, save_load);
    }
}

function save_dump()
{
    with (obj_savesystem)
    {
        if (savestate == save_state.idle)
        {
            savestate = save_state.dumpsave;
            trace("Dumping Save...");
            buffer_async_group_begin(get_savedir());
            savebuff = buffer_create(string_byte_length(savestr) + 1, buffer_fixed, 1);
            buffer_write(savebuff, buffer_string, savestr);
            buffer_save_async(savebuff, "saveData.save", 0, buffer_get_size(savebuff));
            asyncsaveid = buffer_async_group_end();
        }
        else
            ds_queue_enqueue(savequeue, save_dump);
    }
}

function save_clear()
{
    trace("Clearing Save...");
    
    with (obj_savesystem)
        savestr = "";
}

function save_delete()
{
    trace("Deleting Save...");
    directory_destroy(get_savedir());
    obj_savesystem.saveiconalpha = 3;
    obj_savesystem.saveiconspr = spr_saveindicator;
}

function config_dump()
{
    with (obj_savesystem)
    {
        if (savestate == save_state.idle)
        {
            savestate = save_state.dumpconfig;
            trace("Dumping Config...");
            buffer_async_group_begin("");
            configsavebuff = buffer_create(1, buffer_grow, 1);
            var _configasjson = "//WARNING: Editing this file may result in a crash.\n";
            _configasjson += "//In case it does, delete this file and let the game create a new one.\n";
            _configasjson += "//Proceed with caution.\n\n";
            _configasjson += string("CONFIG VERSION: {0}\n\n", 0);
            _configasjson += json_stringify(configstruct, true);
            buffer_write(configsavebuff, buffer_string, _configasjson);
            buffer_save_async(configsavebuff, "optionsData.json", 0, buffer_get_size(configsavebuff));
            asyncconfigsaveid = buffer_async_group_end();
        }
        else
            ds_queue_enqueue(savequeue, config_dump);
    }
}

function config_get_option(_section_name, _option_name, _value)
{
    with (obj_savesystem)
    {
        if (!variable_struct_exists(configstruct, _section_name))
            return _value;
        
        var _sect = variable_struct_get(configstruct, _section_name);
        
        if (!variable_struct_exists(_sect, _option_name))
            return _value;
        
        return variable_struct_get(_sect, _option_name);
    }
}

function config_set_option(_section_name, _option_name, _value)
{
    with (obj_savesystem)
    {
        if (!variable_struct_exists(configstruct, _section_name))
            variable_struct_set(configstruct, _section_name, {});
        
        var _sect = variable_struct_get(configstruct, _section_name);
        variable_struct_set(_sect, _option_name, _value);
    }
}
