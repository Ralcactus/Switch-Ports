function ini_close_os(){
	ini_close();
	
	//if on switch you need to call this to actually save it to the system, else closing the game will lose the save
	if (os_type == os_switch)
		switch_save_data_commit();
}
