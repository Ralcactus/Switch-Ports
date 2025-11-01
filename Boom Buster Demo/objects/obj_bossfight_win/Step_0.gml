if (obj_controller.wizard_sprite == spr_tv_wizard_ouch && obj_controller.wizard_flash == 0 && !blink_set)
{
    obj_controller.wizard_blink = false;
    alarm[1] = 5;
    blink_set = true;
}
