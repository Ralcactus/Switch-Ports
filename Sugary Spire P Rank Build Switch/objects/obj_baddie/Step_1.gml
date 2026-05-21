switch (state)
{
    case baddiestate.idle:
        scr_enemy_idle();
        break;
    
    case baddiestate.turn:
        scr_enemy_turn();
        break;
    
    case baddiestate.walk:
        scr_enemy_walk();
        break;
    
    case baddiestate.land:
        scr_enemy_land();
        break;
    
    case baddiestate.hit:
        scr_enemy_hit();
        break;
    
    case baddiestate.charge:
        scr_enemy_charge();
        break;
    
    case baddiestate.stun:
        scr_enemy_stun();
        break;
    
    case baddiestate.frozen:
        scr_enemy_frozen();
        break;
    
    case baddiestate.shake:
        scr_enemy_shake();
        break;
    
    case baddiestate.float:
        scr_enemy_float();
        break;
    
    case baddiestate.theif:
        scr_enemy_theif();
        break;
    
    case baddiestate.panicwait:
        scr_enemy_panicWait();
        break;
    
    case baddiestate.secretwait:
        scr_enemy_secretWait();
        break;
    
    case baddiestate.Throw:
        scr_enemy_throw();
        break;
    
    case baddiestate.grabbed:
        scr_enemy_grabbed();
        break;
    
    case baddiestate.scared:
        scr_enemy_scared();
        break;
    
    case baddiestate.inhaled:
        scr_enemy_inhaled();
        break;
    
    case baddiestate.cherrywait:
        scr_enemy_cherrywait();
        break;
    
    case baddiestate.cherryactive:
        scr_enemy_charcherry();
        break;
    
    case baddiestate.slugidle:
        scr_enemy_slugidle();
        break;
    
    case baddiestate.slugjump:
        scr_enemy_slugjump();
        break;
    
    case baddiestate.slugparry:
        scr_enemy_slugparry();
        break;
    
    case baddiestate.kick:
        scr_enemy_kick();
        break;
    
    case baddiestate.eyescreamwait:
        scr_enemy_eyescreamwait();
        break;
    
    case baddiestate.eyescream:
        scr_enemy_eyescream();
        break;
    
    case baddiestate.rage:
        scr_enemy_rage();
        break;
    
    case baddiestate.applejimBash:
        scr_applejim_bash();
        break;
}

if (y > (room_height + 64))
    instance_destroy();

if (state != baddiestate.scared)
    ScareBuffer = 0;

if (tauntBuffer == true)
{
    if (!instance_exists(tauntBufferEffect))
    {
        with (instance_create(x, y, obj_baddieangrycloud))
        {
            baddieID = other.id;
            other.tauntBufferEffect = id;
        }
    }
    
    if (obj_player.state != states.backbreaker && obj_player.state != states.parry && object_index != obj_popcornbag)
    {
        tauntBuffer = false;
        bombreset = 0;
        ragereset = 0;
        stunned = 0;
        jumptimer = 0;
        ScareBuffer = 0;
    }
    
    if (obj_player.state != states.backbreaker && obj_player.state != states.parry && object_index == obj_popcornbag)
        tauntBuffer = false;
}

if (place_meeting_solid(x, y) && state == baddiestate.stun && thrown)
    instance_destroy();
