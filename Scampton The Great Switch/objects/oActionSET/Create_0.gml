audio_sound_pitch(snd_scampton_voice, 1);
audio_sound_pitch(snd_scampton_voice_2, 1);
audio_sound_pitch(snd_Parry, 1);
audio_sound_pitch(snd_HeavyThunder, 1);
audio_sound_gain(tlk_congratulations, 1, 0);
audio_sound_gain(tlk_express, 1, 0);
audio_sound_gain(tlk_heart, 1, 0);
audio_sound_gain(tlk_strings, 1, 0);
LPC = true;
oTP.ExtraX = -100;
oMakeUI.AnVil = false;
oMakeUI.BoxEEF = true;
oMakeUI.SMN = true;
SixS = 1;
Pep = 0;
PepDid = 0;
ActionFound = false;
Stop = false;
TheItem = 0;
oAlways.StackNumber = 0;
Pat_1 = 0;
Pat_2 = 0;

if (oMakeUI.FAISD[0] == 2)
{
    oKris.image_index = 0;
    oKris.image_speed = 1;
    oKris.sprite_index = sKris_Act;
}

if (oMakeUI.FAISD[1] == 6 && oMakeUI.Actions[1] != "2_6_S_Mag3" && oMakeUI.Actions[1] != "2_6_Heal_1" && oMakeUI.Actions[1] != "2_6_Heal_2" && oMakeUI.Actions[1] != "2_6_Heal_3")
{
    oSusie.image_index = 0;
    oSusie.image_speed = 1;
    oSusie.sprite_index = sSusie_Act;
}

if (oMakeUI.FAISD[2] == 6 && oMakeUI.Actions[2] != "3_6_S_Mag3" && oMakeUI.Actions[2] != "3_6_Heal_1" && oMakeUI.Actions[2] != "3_6_Heal_2" && oMakeUI.Actions[2] != "3_6_Heal_3")
{
    oRalsei.image_index = 0;
    oRalsei.image_speed = 1;
    oRalsei.sprite_index = sRalsei_Act;
}

i1 = 0;
