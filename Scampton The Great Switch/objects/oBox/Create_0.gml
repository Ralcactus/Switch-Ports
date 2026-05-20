des(28);
audio_sound_gain(tlk_congratulations, 0, 500);
audio_sound_gain(tlk_express, 0, 500);
audio_sound_gain(tlk_heart, 0, 500);
audio_sound_gain(tlk_strings, 0, 500);
An = true;
End = false;
image_xscale = 0;
image_yscale = 0;
image_angle = -180;
HomeX = 0;
HomeY = 0;

if (oMakeUI.Pattern == 1 || oMakeUI.Pattern == 2 || oMakeUI.Pattern == 3 || oMakeUI.Pattern == 4 || oMakeUI.Pattern == 5 || oMakeUI.Pattern == 6 || oMakeUI.Pattern == "B1" || oMakeUI.Pattern == "B2" || oMakeUI.Pattern == "B3" || oMakeUI.Pattern == "N1")
{
}

with (instance_create_depth(0, 0, 0, oEEF))
    Seed = "MoveSpamton";
