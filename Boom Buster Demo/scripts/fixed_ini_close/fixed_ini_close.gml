function fixed_ini_close(){
	ini_close();
	
	if os_type = os_switch
		switch_save_data_commit();
}