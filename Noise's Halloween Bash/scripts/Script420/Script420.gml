
//Delete this line if gml_pragma doesn´t exists
gml_pragma("global", "scr_switchCrashLogmanager()")

function scr_switchCrashLogmanager()
{
	if (os_type != os_switch)
		exit;
		
    global.NXCrashLogID = switch_accounts_open_preselected_user()

    exception_unhandled_handler(function(e)
    {
        var _filename = "SwitchCrashLog.txt"
       
        switch_save_data_unmount()
        switch_save_data_mount(global.NXCrashLogID)
       
        var _f = file_text_open_write(_filename)
        file_text_write_string(_f, string(e))
        file_text_close(_f)
       
        switch_save_data_commit()
        switch_save_data_unmount()
    })
}