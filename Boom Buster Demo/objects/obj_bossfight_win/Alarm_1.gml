obj_controller.wizard_blink = true;
blinks++;

if (blinks == 1)
    alarm[1] = 5;

if (blinks == 2)
{
    obj_controller.wizard_blink = false;
    alarm[1] = 5;
}

if (blinks == 3)
    obj_controller.wizard_blink = true;
