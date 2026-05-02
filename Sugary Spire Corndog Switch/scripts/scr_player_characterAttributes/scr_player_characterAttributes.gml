function scr_getCharacterSprite(arg0, arg1 = character)
{
    var prefix_length = 14;
    var sprite_name = string_delete(sprite_get_name(arg0), 1, prefix_length);
    var character_prefix = ["PZ", "PN", "RM", "GB", "CB", "JB"];
    var asset_string = string("spr_player_{0}_{1}", character_prefix[arg1], sprite_name);
    
    if (asset_get_index(asset_string) <= -1)
        return arg0;
    
    return asset_get_index(asset_string);
}

function scr_characterSprite()
{
    spr_idle = scr_getCharacterSprite(spr_player_PZ_idle);
    spr_move = scr_getCharacterSprite(spr_player_PZ_walk);
    spr_smallComboIdle = scr_getCharacterSprite(spr_player_PZ_idle_comboSmall);
    spr_bigComboIdle = scr_getCharacterSprite(spr_player_PZ_idle_comboBig);
    spr_smallComboWalk = scr_getCharacterSprite(spr_player_PZ_walk_comboSmall);
    spr_bigComboWalk = scr_getCharacterSprite(spr_player_PZ_walk_comboBig);
    spr_angryidle = scr_getCharacterSprite(spr_player_PZ_idle_supercharged);
    spr_angrywalk = scr_getCharacterSprite(spr_player_PZ_walk_supercharged);
    spr_crawl = scr_getCharacterSprite(spr_player_PZ_crawl);
    spr_hurt = scr_getCharacterSprite(spr_player_PZ_stun);
    spr_jump = scr_getCharacterSprite(spr_player_PZ_jump);
    spr_fall = scr_getCharacterSprite(spr_player_PZ_fall);
    spr_runskid = scr_getCharacterSprite(spr_player_PZ_skid);
    spr_uppercutbegin = scr_getCharacterSprite(spr_player_PZ_uppercut_intro);
    spr_uppercutend = scr_getCharacterSprite(spr_player_PZ_uppercut_end);
    spr_bodyslamstart = scr_getCharacterSprite(spr_player_PZ_groundPound_intro);
    spr_bodyslamfall = scr_getCharacterSprite(spr_player_PZ_groundPound);
    spr_bodyslamland = scr_getCharacterSprite(spr_player_PZ_groundPound_land);
    spr_bombdropstart = scr_getCharacterSprite(spr_player_PZ_divebomb_start);
    spr_bombdropfall = scr_getCharacterSprite(spr_player_PZ_divebomb_fall);
    spr_bombdropland = scr_getCharacterSprite(spr_player_PZ_divebomb_land);
    spr_crouch = scr_getCharacterSprite(spr_player_PZ_crouch);
    spr_crouchjump = scr_getCharacterSprite(spr_player_PZ_crouch_jump);
    spr_crouchfall = scr_getCharacterSprite(spr_player_PZ_crouch_fall);
    spr_couchstart = scr_getCharacterSprite(spr_player_PZ_crouch_intro);
    spr_splat = scr_getCharacterSprite(spr_player_PZ_splat);
    spr_bump = scr_getCharacterSprite(spr_player_PZ_bumped);
    spr_land = scr_getCharacterSprite(spr_player_PZ_land);
    spr_land2 = scr_getCharacterSprite(spr_player_PZ_land_walk);
    spr_lookdoor = scr_getCharacterSprite(spr_player_PZ_enter);
    spr_walkfront = scr_getCharacterSprite(spr_player_PZ_walkFront);
    spr_victory = scr_getCharacterSprite(spr_player_PZ_enter_key);
    spr_Ladder = scr_getCharacterSprite(spr_player_PZ_ladder_idle);
    spr_laddermove = scr_getCharacterSprite(spr_player_PZ_ladder_up);
    spr_ladderdown = scr_getCharacterSprite(spr_player_PZ_ladder_down);
    spr_crouchslip = scr_getCharacterSprite(spr_player_PZ_crouchSlip);
    spr_crouchslipfall = scr_getCharacterSprite(spr_player_PZ_crouchSlip_fall);
    spr_crouchslipintro = scr_getCharacterSprite(spr_player_PZ_crouchSlip_intro);
    spr_slippingonice = scr_getCharacterSprite(spr_player_PZ_slipping);
    spr_mach1 = scr_getCharacterSprite(spr_player_PZ_mach1);
    spr_mach2 = scr_getCharacterSprite(spr_player_PZ_mach2);
    spr_mach3player = scr_getCharacterSprite(spr_player_PZ_mach3);
    spr_mach3hit = scr_getCharacterSprite(spr_player_PZ_mach3_hit);
    spr_climbCeilingMach = scr_getCharacterSprite(spr_player_climbCeilingMach);
    spr_climbCeilingJump = scr_getCharacterSprite(spr_player_PZ_ceilingJump);
    spr_climbCeilingFall = scr_getCharacterSprite(spr_player_PZ_ceilingJump_fall);
    spr_mach2ceiling = scr_getCharacterSprite(spr_player_climbceilingmach2);
    spr_mach3ceiling = scr_getCharacterSprite(spr_player_climbceilingmach3);
    spr_machdashpad = scr_getCharacterSprite(spr_player_PZ_mach3_dashPad);
    spr_rollgetup = scr_getCharacterSprite(spr_player_PZ_machRoll_getUp);
    spr_mach3jump = scr_getCharacterSprite(spr_player_PZ_mach3_jump);
    spr_mach3hitwall = scr_getCharacterSprite(spr_player_PZ_hitWall_mach3);
    spr_crazyrun = scr_getCharacterSprite(spr_player_PZ_mach4);
    spr_secondjump1 = scr_getCharacterSprite(spr_player_PZ_mach2_jump);
    spr_secondjump2 = scr_getCharacterSprite(spr_player_PZ_mach2_fall);
    spr_machslidestart = scr_getCharacterSprite(spr_player_PZ_machSkid_intro);
    spr_machslide = scr_getCharacterSprite(spr_player_PZ_machSkid);
    spr_machslideend = scr_getCharacterSprite(spr_player_PZ_machSkid_end);
    spr_grindrail = scr_getCharacterSprite(spr_player_PZ_grinding);
    spr_hanging = scr_getCharacterSprite(spr_player_PZ_hang);
    spr_machslideboost = scr_getCharacterSprite(spr_player_PZ_mach2_turn);
    spr_machslideboostFallStart = scr_getCharacterSprite(spr_player_PZ_mach2_turnFall_intro);
    spr_machslideboostFall = scr_getCharacterSprite(spr_player_PZ_mach2_turnFall);
    spr_machslideboost3 = scr_getCharacterSprite(spr_player_PZ_mach3_turn);
    spr_machslideboost3FallStart = scr_getCharacterSprite(spr_player_PZ_mach3_turnFall_intro);
    spr_machslideboost3Fall = scr_getCharacterSprite(spr_player_PZ_mach3_turnFall);
    spr_land2 = scr_getCharacterSprite(spr_player_PZ_land_walk);
    spr_stomp = scr_getCharacterSprite(spr_player_PZ_stomp);
    spr_stompprep = scr_getCharacterSprite(spr_player_PZ_stomp_intro);
    spr_crouchslide = scr_getCharacterSprite(spr_player_PZ_crouchSlip);
    spr_crouch = scr_getCharacterSprite(spr_player_PZ_crouch);
    spr_bump = scr_getCharacterSprite(spr_player_PZ_bumped);
    spr_victory = scr_getCharacterSprite(spr_player_PZ_enter_key);
    spr_hurt = scr_getCharacterSprite(spr_player_PZ_stun);
    spr_climbwall = scr_getCharacterSprite(spr_player_PZ_climbWall);
    spr_climbdownwall = scr_getCharacterSprite(spr_player_climbdownwall);
    spr_grab = scr_getCharacterSprite(spr_player_PZ_hauling_idle);
    spr_mach2jump = scr_getCharacterSprite(spr_player_PZ_mach2_spinJump);
    spr_Timesup = scr_getCharacterSprite(spr_player_PZ_gateSurprise);
    spr_deathstart = scr_getCharacterSprite(spr_player_PZ_death_intro);
    spr_deathend = scr_getCharacterSprite(spr_player_PZ_death_end);
    spr_machpunch1 = scr_getCharacterSprite(spr_player_PZ_mach2_hit2);
    spr_machpunch2 = scr_getCharacterSprite(spr_player_PZ_mach2_hit1);
    spr_hurtjump = scr_getCharacterSprite(spr_player_PZ_hurt);
    spr_entergate = scr_getCharacterSprite(spr_player_PZ_enter_gate);
    spr_bossintro = scr_getCharacterSprite(spr_player_PZ_bossIntro);
    spr_suplexmash1 = scr_getCharacterSprite(spr_player_PZ_finishingBlow_1);
    spr_suplexmash2 = scr_getCharacterSprite(spr_player_PZ_finishingBlow_2);
    spr_suplexmash3 = scr_getCharacterSprite(spr_player_PZ_finishingBlow_3);
    spr_suplexmash4 = scr_getCharacterSprite(spr_player_PZ_finishingBlow_4);
    spr_airdash1 = scr_getCharacterSprite(spr_player_PZ_mach1_jump);
    spr_airdash2 = scr_getCharacterSprite(spr_player_PZ_mach1_fall);
    spr_idle1 = scr_getCharacterSprite(spr_player_PZ_idleAnim_1);
    spr_idle2 = scr_getCharacterSprite(spr_player_PZ_idleAnim_2);
    spr_idle3 = scr_getCharacterSprite(spr_player_PZ_idleAnim_3);
    spr_idle4 = scr_getCharacterSprite(spr_player_PZ_idleAnim_4);
    spr_idle5 = scr_getCharacterSprite(spr_player_PZ_idleAnim_5);
    spr_idle6 = scr_getCharacterSprite(spr_player_PZ_idleAnim_6);
    spr_gotTreasure = scr_getCharacterSprite(spr_player_PZ_gotTreasure);
    spr_parry1 = scr_getCharacterSprite(spr_player_PZ_parry_1);
    spr_parry2 = scr_getCharacterSprite(spr_player_PZ_parry_2);
    spr_parry3 = scr_getCharacterSprite(spr_player_PZ_parry_3);
    spr_supertaunt1 = scr_getCharacterSprite(spr_player_PZ_superTaunt_1);
    spr_supertaunt2 = scr_getCharacterSprite(spr_player_PZ_superTaunt_2);
    spr_supertaunt3 = scr_getCharacterSprite(spr_player_PZ_superTaunt_3);
    spr_suplexdash = scr_getCharacterSprite(spr_player_PZ_suplexDash);
    spr_piledriver = scr_getCharacterSprite(spr_player_PZ_pileDriver);
    spr_piledriverland = scr_getCharacterSprite(spr_player_PZ_pileDriver_land);
    spr_taunt = scr_getCharacterSprite(spr_player_PZ_tauntStills);
    spr_selectpal = scr_getCharacterSprite(spr_pizzelleselectpal);
    paletteSprite = scr_getCharacterSprite(spr_pal);
    spr_caneidle = scr_getCharacterSprite(spr_player_PZ_idle_cane);
    spr_caneslam = scr_getCharacterSprite(spr_player_PZ_caneSlam);
    spr_canewalk = scr_getCharacterSprite(spr_player_PZ_walk_cane);
    spr_canesuplex = scr_getCharacterSprite(spr_player_PZ_caneSuplex);
    spr_canehit = scr_getCharacterSprite(spr_player_PZ_caneHit);
    spr_uppizzabox = scr_getCharacterSprite(spr_player_PZ_pipeUp_getIn);
    spr_downpizzabox = scr_getCharacterSprite(spr_player_PZ_pipeDown_getIn);
    spr_uppizzabox_getout = scr_getCharacterSprite(spr_player_PZ_pipeUp_getOut);
    spr_downpizzabox_getout = scr_getCharacterSprite(spr_player_PZ_pipeDown_getOut);
    spr_tumblestart = scr_getCharacterSprite(spr_player_PZ_tumble_intro);
    spr_tumble = scr_getCharacterSprite(spr_player_PZ_tumble);
    spr_tumbleend = scr_getCharacterSprite(spr_player_PZ_tumble_end);
    spr_taunt = scr_getCharacterSprite(spr_player_PZ_tauntStills);
    spr_machroll = scr_getCharacterSprite(spr_player_PZ_machRoll);
    spr_machroll3intro = scr_getCharacterSprite(spr_player_PZ_machRoll3_intro);
    spr_machroll3 = scr_getCharacterSprite(spr_player_PZ_machRoll3);
    spr_dive = scr_getCharacterSprite(spr_player_PZ_dive);
    spr_cottonidle = scr_getCharacterSprite(spr_player_PZ_cotton_idle);
    spr_escapeidle = scr_getCharacterSprite(spr_player_PZ_idle_escape);
    spr_timesupidle = scr_getCharacterSprite(spr_player_PZ_idle_timesUp);
    spr_petdog = scr_getCharacterSprite(spr_player_PZ_dogMount_pet);
    spr_miniTransform = scr_getCharacterSprite(spr_player_mini_transform);
    spr_miniIdle = scr_getCharacterSprite(spr_player_mini_idle);
    spr_miniWalk = scr_getCharacterSprite(spr_player_mini_walk);
    spr_miniJump = scr_getCharacterSprite(spr_player_mini_jump);
    spr_miniFall = scr_getCharacterSprite(spr_player_mini_fall);
    spr_miniPunch = scr_getCharacterSprite(spr_player_mini_punch);
    spr_miniLand = scr_getCharacterSprite(spr_player_mini_land);
    spr_miniDoor = scr_getCharacterSprite(spr_player_mini_door);
    spr_miniMach = scr_getCharacterSprite(spr_player_mini_mach);
    spr_miniUppercut = scr_getCharacterSprite(spr_player_mini_uppercut);
    spr_miniBump = scr_getCharacterSprite(spr_player_mini_bump);
	
	spr_wallJumpIntro = scr_getCharacterSprite(spr_player_PZ_wallJump_intro)
	spr_wallJump = scr_getCharacterSprite(spr_player_PZ_wallJump)
	spr_wallJumpCancelIntro = scr_getCharacterSprite(spr_player_PZ_wallJumpCancel_intro)
	spr_wallJumpCancel = scr_getCharacterSprite(spr_player_PZ_wallJumpCancel)
	spr_wallJumpFastFallIntro = scr_getCharacterSprite(spr_player_PZ_wallJumpFastFall_intro)
	spr_wallJumpFastFall = scr_getCharacterSprite(spr_player_PZ_wallJumpFastFall)
	
    var char_arr = [UnknownEnum.Value_0, UnknownEnum.Value_1, UnknownEnum.Value_3, UnknownEnum.Value_4];
    
    for (var i = 0; i < array_length(char_arr); i++)
    {
        if (character == char_arr[i])
        {
            fmod_global_setParameter("character", i, true);
            break;
        }
    }
}
