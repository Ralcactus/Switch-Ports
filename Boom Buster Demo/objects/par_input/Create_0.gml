key_default[0] = 37;
key_default[1] = 39;
key_default[2] = 38;
key_default[3] = 40;
key_default[4] = 90;
key_default[5] = 88;
key_default[6] = 67;
key_default[7] = 16;
key_default[8] = 32;
key_default[9] = 27;
key_default[10] = 8;

for (var i = 0; i <= 10; i++)
    button_alt[i] = -4;

button[4] = 32769;
button[5] = 32771;
button[6] = 32776;
button_alt[6] = 32774;
button[7] = 32775;
button_alt[7] = 32773;
button[8] = 32772;
button_alt[8] = 32770;
button[9] = 32778;
button[10] = 32777;
ini_open("options.ini");

for (var i = 0; i <= 10; i++)
{
    key[i] = ini_read_real("KEYMAPS", i, key_default[i]);
    check[i] = false;
    pressed[i] = false;
    pressed_clear[i] = false;
}

fixed_ini_close();

gamepad_get = function(arg0, arg1)
{
    if (arg1 == 0)
        return gamepad_axis_value(arg0, gp_axislh) < 0 || gamepad_button_check(arg0, gp_padl);
    else if (arg1 == 1)
        return gamepad_axis_value(arg0, gp_axislh) > 0 || gamepad_button_check(arg0, gp_padr);
    else if (arg1 == 2)
        return gamepad_axis_value(arg0, gp_axislv) < 0 || gamepad_button_check(arg0, gp_padu);
    else if (arg1 == 3)
        return gamepad_axis_value(arg0, gp_axislv) > 0 || gamepad_button_check(arg0, gp_padd);
    else
        return gamepad_button_check(arg0, button[arg1]) || (button_alt[arg1] != -4 && gamepad_button_check(arg0, button_alt[arg1]));
};

device = 0;
device_name = "NOT CONNECTED";
input_last = 0;
