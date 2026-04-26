trace("Created :  " + string(fmod_create()));
trace("Initialized :  " + string(fmod_init(32)));
var banks = ["sound/Desktop/Master.strings.bank", "sound/Desktop/Master.bank", "sound/Desktop/music.bank", "sound/Desktop/sfx.bank"];

for (var i = 0; i < array_length(banks); i++)
{
    var b = working_directory + banks[i];
    var load_bank = fmod_loadBank(b);
    show_debug_message(string(banks[i]) + " :  " + string(load_bank));
    fmod_bank_loadSampleData(load_bank);
}

z = 0;
size = 0;
trace(string("Listener Status: {0}; Position: {1}, {2}, {3}", fmod_listener_setPosition(0, x, y, z), x, y, z));
showDebug = false;
global.FMOD_OneShotList = ds_list_create();
set_volume_options();
