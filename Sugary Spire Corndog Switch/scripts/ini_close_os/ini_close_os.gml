#macro OLD_ini_close ini_close
#macro ini_close ini_close_os

function ini_close_os(){
	OLD_ini_close();
	
	//if on switch you need to call this to actually save it to the system, else closing the game will lose the save
	if (os_type == os_switch)
		switch_save_data_commit();
}
