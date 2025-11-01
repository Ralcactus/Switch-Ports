testvariablenothing = false;
wizard_yoff = 30;
splash_text_choices = [];
var _str_gameover = "Nothing I love more than<break>that Game Over, look at that.<break>\"Game Over!\", man. What a view.";
splash_text_choices = [["HA! HAHAHAHA! Ahhh, sorry.<break>Just... you wouldn't get it.", voice_death_youwouldntgetit], ["I've actually beaten this one before. You just have to, uh, press the buttons.", voice_death_pressthebuttons], ["I'm actually way smarter than you. Like, a lot smarter.", voice_death_waysmarterthanyou], ["Ooh, I love this song.<break>Reminds me of the time you FAILED.", voice_death_ilovethissong], ["Mmm. Smell that? That's fail.", voice_death_thatsfail], ["Orange nose? What even is that? Green face, well...<break>That's a different story.", voice_death_greenface], ["Have fun serving me for the rest of your ant-sized life.<break>Now, go get me a beer.", voice_death_havefunservingme], ["I know you can't see it but I'm actually smiling really hard right now.", voice_death_smilingreallyhard], [_str_gameover, voice_death_gameover], ["Man, this is awesome, you just died! Imagine if you were me and that happened. The ultimate feeling.", voice_death_ultimatefeeling], ["HAH! I'm so cool.", voice_death_imsocool], ["Wait, you couldn't beat that one?<break>Of all the games, you couldn't beat THAT one?", voice_death_youcouldntbeatthatone], ["You just died.<break>And that was 'cause of me.<break>I did that! Wow.", voice_death_thatwascauseofmeididthat], ["You play like you have your eyes tied behind your back.<break>Heh. Eyes. Behind your back. Heheh.", voice_death_eyesbehindyourback], ["Wha-, come on, you suck!", voice_death_yousuck]];
splash_text_num = irandom_range(0, array_length(splash_text_choices) - 1);
splash_text = splash_text_choices[splash_text_num][0];
ready = false;
percent = 0;
alarm[0] = 1;
array[0] = [0.035, 0];
array[1] = [0.025, 0.0125];
array[2] = [0, 0.025];
type_out = false;
splash_draw = false;
wizard_line = -4;
timer[0] = -1;

timer_func[0] = function()
{
    type_out = true;
    wizard_line = audio_play_sound(splash_text_choices[splash_text_num][1], 0, 0);
    splash_draw = true;
};

pause = 0;
