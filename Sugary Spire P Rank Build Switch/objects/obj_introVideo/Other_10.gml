if (FirstRoom != rm_disclaimer && FirstRoom != rm_verify)
	obj_player.state = states.normal;

room_goto(FirstRoom);