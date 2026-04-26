switch (state)
{
	case EnemyStates.idle:
		scr_enemy_idle()
		break
	
	case EnemyStates.turn:
		scr_enemy_turn()
		break
	
	case EnemyStates.walk:
		scr_enemy_walk()
		break
	
	case EnemyStates.hit:
		scr_enemy_hit()
		break
	
	case EnemyStates.charge:
		scr_enemy_charge()
		break
	
	case EnemyStates.stun:
		scr_enemy_stun()
		break
	
	case EnemyStates.frozen:
		scr_enemy_frozen()
		break
	
	case EnemyStates.unknownreset:
		hsp = 0
		vsp = 0
		break
	
	case EnemyStates.float:
		scr_enemy_float()
		break
	
	case EnemyStates.thief:
		scr_enemy_thief()
		break
	
	case EnemyStates.panicWait:
		scr_enemy_panicWait()
		break
	
	case EnemyStates.secretWait:
		scr_enemy_secretWait()
		break
	
	case EnemyStates.thro:
		scr_enemy_throw()
		break
	
	case EnemyStates.grabbbed:
		scr_enemy_grabbed()
		break
	
	case EnemyStates.scared:
		scr_enemy_scared()
		break
	
	case EnemyStates.cherrywait:
		scr_enemy_cherrywait()
		break
	
	case EnemyStates.charcherry:
		scr_enemy_charcherry()
		break
	
	case EnemyStates.slugjump:
		scr_enemy_slugjump()
		break
	
	case EnemyStates.slugparry:
		scr_enemy_slugparry()
		break
	
	case EnemyStates.eyescreamwait:
		scr_enemy_eyescreamwait()
		break
	
	case EnemyStates.eyescream:
		scr_enemy_eyescream()
		break
	
	case EnemyStates.rage:
		scr_enemy_rage()
		break
}

if (baddieCollisionBoxEnabled)
	scr_baddieCollisionBox()

if (y > (room_height + 64))
	instance_destroy()

if (state != EnemyStates.scared && state != EnemyStates.frozen)
	baddieScareBuffer = 0

if (tauntBuffer)
{
	if (!instance_exists(tauntBufferEffect))
	{
		with (instance_create(x, y, obj_baddieAngryCloud, 
		{
			baddieID: id
		}))
			other.tauntBufferEffect = id
	}
	
	if (!global.freezeframe)
	{
		if (obj_parent_player.state != PlayerState.taunt && obj_parent_player.state != PlayerState.parry && state != EnemyStates.thro)
		{
			tauntBuffer = false
			enemyAttackTimer = 0
			ragereset = 0
			baddieStunTimer = 0
			enemyAttackTimer = 0
			burrowTimer = 0
			baddieScareBuffer = 0
		}
	}
}

if (state == EnemyStates.stun && baddieStunTimer >= 50 && !birdCreated && object_index != obj_coneboyCutout && object_index != obj_cherrycardboard)
{
	birdCreated = true
	instance_create(x, y - 40, obj_enemyBirdEffect, 
	{
		baddieID: id
	})
}

if (doRedAfterImage && redAfterImagebuffer-- < 0)
{
	with (create_afterimage(AfterImageType.baddie, image_xscale))
		image_alpha = 0.85
	
	redAfterImagebuffer = redAfterImagebufferMax
}

doRedAfterImage = false
wetTimer = approach(wetTimer, 0, 1)

if (wetTimer > 0 && wetTimerEffect-- <= 0)
	wetTimerEffect = 3

if (baddieInvincibilityBuffer > 0 && !global.freezeframe)
	baddieInvincibilityBuffer--

if (global.freezeframe && state != EnemyStates.frozen)
{
	frozenState = state
	frozenSpriteIndex = sprite_index
	frozenImageIndex = image_index
	frozenImageSpeed = image_speed
	frozenMoveSpeed = movespeed
	frozenGrav = grav
	frozenHsp = hsp
	frozenVsp = vsp
	state = EnemyStates.frozen
}

if (markedForDeath && !global.freezeframe && object_index != obj_iceblock)
{
	instance_destroy()
	create_particle(x, y, spr_genericPoofEffect)
}

if (flash && alarm[2] <= 0)
	alarm[2] = room_speed * 0.15

if (state != EnemyStates.grabbbed)
	depth = 0

if (grounded && vsp > 0 && sprite_index == baddieSpriteWalk && sprite_animation_end() && sign(hsp) == sign(image_xscale))
	create_particle(x - (image_xscale * 20), y + 43, spr_cloudEffect)
