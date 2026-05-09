#macro OLD_ini_close ini_close
#macro ini_close ini_close_os

function ini_close_os(){
	if (os_type == os_switch)
		close_ini_NX();
	else
		OLD_ini_close();
}

function get_current_account()
{
    for (var i = 0; i < switch_accounts_get_accounts(); i++)
    {
        if (switch_accounts_is_user_open(i))
            return i;
    }
    
    return -1;
}

function close_ini_NX()
{
    var acc = get_current_account();
    
    if (acc != -1)
    {
        switch_save_data_mount(acc);
        OLD_ini_close();
        show_debug_message("saved to temp cache");
        switch_save_data_commit();
        switch_save_data_unmount();
        show_debug_message("allegedly saved?");
    }
}
