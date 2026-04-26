if (obj_parent_player.key_jump)
{
	var setChoice = global.dialogchoices[choice_selected]
	var _func = setChoice[1]
	show_debug_message(string("Dialogue Choices Function: {0}", _func))
	
	if (_func != -4)
		_func()
	
	instance_destroy()
}
