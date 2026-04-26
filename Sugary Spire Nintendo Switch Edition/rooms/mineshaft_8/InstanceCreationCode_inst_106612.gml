flags.do_once_per_save = true

condition = function()
{
	return ds_list_find_index(global.SaveRoom, 106083) != -1 && global.minesProgress == false;
}

output = function()
{
	global.minesProgress = true
}
