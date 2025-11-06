// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fixed_ini_close(){
	ini_close();
	
	if os_type = os_switch
		switch_save_data_commit();
}