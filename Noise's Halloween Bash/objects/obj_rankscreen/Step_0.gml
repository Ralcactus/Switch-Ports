if (fade <= 0)
{
    switch (state)
    {
        case states.normal:
            totalsigny += totalsignvsp;
            totalsignvsp += 0.5;
            
            if (totalsigny >= 0)
            {
                totalsigny = 0;
                
                if (totalsignbounced == 0)
                {
                    event_play_oneshot("event:/sfx/misc/ranksignfall");
                    totalsignbounced = 1;
                    totalsignvsp = -8;
                }
                else if (totalsignbounced == 1)
                {
                    event_play_oneshot("event:/sfx/misc/ranksignland");
                    totalsignbounced = 2;
                    totalsignvsp = -3;
                }
                else if (totalsignbounced == 2)
                {
                    if (advancetimer == -1)
                    {
                        event_play_oneshot("event:/sfx/misc/ranksignland");
                        advancetimer = 20;
                    }
                    
                    if (advancetimer == 0)
                    {
                        state = states.jump;
                        advancetimer = -1;
                    }
                }
            }
            
            break;
        
        case states.jump:
            scorecount += scorecounttime;
            scorecounttime += 0.1;
            
            if (totalscore > 0)
            {
                if (countsndtimer <= 0)
                {
                    var _ev = event_play_oneshot("event:/sfx/misc/rankcount");
                    fmod_studio_event_instance_set_parameter_by_name(_ev, "state", (scorecount / max(5000, totalscore)) * 10);
                    countsndtimer = 4;
                }
                
                countsndtimer--;
            }
            
            if (scorecount >= totalscore)
            {
                scorecount = totalscore;
                
                if (advancetimer == -1)
                {
                    if (totalscore == 0)
                    {
                        scoreshake = 3;
                        event_play_oneshot("event:/sfx/pausemenu/buzzer");
                    }
                    
                    advancetimer = 20;
                }
                
                if (advancetimer == 0)
                {
                    state = states.standstillrun;
                    advancetimer = -1;
                }
            }
            
            break;
        
        case states.standstillrun:
            var _prevpumpcount = pumpkincount;
            pumpkincount += 0.25;
            
            if (totalpumpkins > 0)
            {
                if (countsndtimer <= 0 && floor(pumpkincount) > floor(_prevpumpcount))
                {
                    var _ev = event_play_oneshot("event:/sfx/misc/rankcount");
                    fmod_studio_event_instance_set_parameter_by_name(_ev, "state", pumpkincount);
                    countsndtimer = 4;
                }
                
                countsndtimer--;
            }
            
            if (pumpkincount >= totalpumpkins)
            {
                pumpkincount = totalpumpkins;
                
                if (advancetimer == -1)
                {
                    if (totalpumpkins == 0)
                    {
                        pumpkinshake = 4;
                        event_play_oneshot("event:/sfx/pausemenu/buzzer");
                    }
                    
                    advancetimer = 20;
                }
                
                if (advancetimer == 0)
                {
                    state = states.sprint;
                    advancetimer = -1;
                }
            }
            
            break;
        
        case states.sprint:
            cratesmashtime = max(cratesmashtime - 0.001, 1);
            
            if (cratesmissed == 0)
            {
                if (advancetimer == -1)
                    advancetimer = 20;
                
                if (advancetimer == 0)
                {
                    state = states.sprintjump;
                    advancetimer = -1;
                }
            }
            else
            {
                if (advancetimer == -1)
                    advancetimer = input_check("dash") ? 5 : 20;
                
                if (advancetimer == 0)
                {
                    var _repeat = 1;
                    
                    if (cratesmashtime <= 8)
                        _repeat++;
                    
                    if (cratesmashtime <= 7)
                        _repeat++;
                    
                    for (var _i = 0; _i < _repeat; _i++)
                    {
                        if ((crateshit + instance_number(obj_rankcrate)) >= cratesmissed)
                        {
                            if (!instance_exists(obj_rankcrate))
                            {
                                crateshit = cratesmissed;
                                state = states.sprintjump;
                            }
                            else
                                advancetimer = 40;
                            
                            break;
                        }
                        else
                        {
                            instance_create_depth(x, y, depth - 1, obj_rankcrate, { type: _i });
                            advancetimer = min(input_check("dash") ? 5 : floor(cratesmashtime), floor(cratesmashtime));
                        }
                    }
                }
            }
            
            break;
        
        case states.sprintjump:
            if (advancetimer == -1)
                advancetimer = 0;
            
            if (advancetimer == 0)
            {
                curgem++;
                
                if (curgem == 4)
                {
                    state = states.machslide;
                    rank = get_rank(global.collect, global.pumpkintotal, global.destroyedcount, global.gems);
                    var _rankev = event_play_oneshot("event:/sfx/misc/ranksound");
                    fmod_studio_event_instance_set_parameter_by_name(_rankev, "state", rank);
                    
                    switch (rank)
                    {
                        case Rank.Shit:
                            alarm[0] = 425;
                            break;
                        
                        case Rank.Meh:
                            alarm[0] = 690;
                            break;
                        
                        case Rank.Good:
                            alarm[0] = 960;
                            break;
                        
                        case Rank.Perfect:
                            alarm[0] = 810;
                            break;
                        
                        default:
                            alarm[0] = 60;
                    }
                    
                    advancetimer = -1;
                    fmod_studio_event_instance_start(signsqueak);
                }
                else
                {
                    var _hasgem = bit_get(totalgems, curgem);
                    
                    if (_hasgem)
                    {
                        gemcount = bit_set(gemcount, curgem, false);
                        event_play_oneshot("event:/sfx/misc/rankgem");
                    }
                    else
                    {
                        signshake = 4;
                        event_play_oneshot("event:/sfx/pausemenu/buzzer");
                    }
                    
                    advancetimer = 75;
                }
            }
            
            break;
        
        case states.machslide:
            ranksigny += 2;
            
            if (ranksigny >= 0)
            {
                ranksigny = 0;
                event_stop(signsqueak, true);
                state = states.hurt;
            }
        
        case states.hurt:
            switch (rank)
            {
                case Rank.Perfect:
                    noisespr = spr_player_rankperfect;
                    audiencespr = spr_rankaudience_goodperfect;
                    break;
                
                case Rank.Good:
                    noisespr = spr_player_rankgood;
                    audiencespr = spr_rankaudience_goodperfect;
                    break;
                
                case Rank.Meh:
                    noisespr = spr_player_rankmeh;
                    audiencespr = spr_rankaudience_meh;
                    break;
                
                case Rank.Shit:
                    noisespr = spr_player_rankshit;
                    audiencespr = spr_rankaudience_shit;
                    break;
            }
            
            break;
    }
}
else
{
    fade = max(fade - 0.05, 0);
}

if (advancetimer != -1)
    advancetimer = max(advancetimer - 1, 0);

scoreshake = approach(scoreshake, 0, 0.1);
pumpkinshake = approach(pumpkinshake, 0, 0.1);
crateshake = approach(crateshake, 0, 0.1);
signshake = approach(signshake, 0, 0.1);

if (state != states.machslide && state != states.hurt)
{
    if (crateshit > 0)
        noisespr = spr_player_rankfewcrates;
    
    if (crateshit >= 50)
        noisespr = spr_player_rankmanycrates;
    
    if (crateshit >= 100)
        noisespr = spr_player_ranktoomanycrates;
}

noiseind += 0.35;

if (noiseind > sprite_get_number(noisespr))
{
    if (noisespr == spr_player_rankfewcrates || noisespr == spr_player_rankmanycrates || noisespr == spr_player_ranktoomanycrates)
        noiseind = sprite_get_number(noisespr) - 1;
    else
        noiseind %= sprite_get_number(noisespr);
}

audienceind += 0.1;

if (audienceind > sprite_get_number(audiencespr))
    audienceind %= sprite_get_number(audiencespr);
