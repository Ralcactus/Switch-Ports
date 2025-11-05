var _id = async_load[? "id"];

switch (savestate)
{
    case save_state.dumpsave:
        if (_id == asyncsaveid)
        {
            buffer_delete(savebuff);
            savestate = save_state.idle;
            trace("Game Save Status: ", async_load[? "status"]);
        }
        
        break;
    
    case save_state.loadsave:
        if (_id == asyncloadid)
        {
            var _ini = buffer_read(loadbuff, buffer_string);
            ini_open_from_string(_ini);
            savestr = ini_close();
            buffer_delete(loadbuff);
            savestate = save_state.idle;
            trace("Game Load Status: ", async_load[? "status"]);
        }
        
        break;
    
    case save_state.dumpconfig:
        if (_id == asyncconfigsaveid)
        {
            buffer_delete(configsavebuff);
            savestate = save_state.idle;
            trace("Config Save Status: ", async_load[? "status"]);
        }
        
        break;
}
