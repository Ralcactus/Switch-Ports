scr_collision_init();
state = UnknownEnum.Value_1;
grav = 0.5;
setID = false;
dialog = [create_dialogue("THIS IS A DEFAULT DIALOG.\nIF YOU'RE SEEING THIS IN GAME, PLEASE REPORT THIS AS A BUG.")];
talked_amt = 0;
sin_add = 0;
sin_set = 0;
sin_mag = 0;
sin_dir = 0;
sin_move = 0;
sin_x = 0;
sin_y = 0;
shake_magx = 0;
shake_magx_acc = 0.6;
shake_timer = 3;
shake_delay = 3;
shake_dir = 1;
draw_shakex = 0;
shake_magy = 0;
shake_magy_acc = 0;
draw_shakey = 0;

dialog_function = function()
{
    obj_parent_player.state = UnknownEnum.Value_93;
    queue_dialogue(dialog);
};

talk_condition = function()
{
    return place_meeting(x, y, obj_parent_player) && obj_parent_player.key_up2 && obj_parent_player.state != UnknownEnum.Value_93;
};

step_event = function()
{
};
