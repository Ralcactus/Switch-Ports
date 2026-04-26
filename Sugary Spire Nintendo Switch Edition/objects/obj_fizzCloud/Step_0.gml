if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != EnemyStates.inhaled)
	state = EnemyStates.inhaled

if (state != PlayerState.stun)
	depth = 0

if (state != PlayerState.charge && state != PlayerState.freezeframe)
	thrown = 0

enemyAttackTimer = max(enemyAttackTimer - 1, 0)

if (((obj_parent_player.x > (x - 50) && obj_parent_player.x < (x + 50)) && (y <= (obj_parent_player.y + 300) && y >= (obj_parent_player.y - 300))) && obj_parent_player.state != PlayerState.cotton && obj_parent_player.state != PlayerState.cottondrill && obj_parent_player.state != PlayerState.door && obj_parent_player.state != PlayerState.cottonroll)
{
	if (state != PlayerState.titlescreen && enemyAttackTimer <= 0 && obj_parent_player.state != PlayerState.cotton)
	{
		if (state == EnemyStates.float)
		{
			image_index = 0
			state = PlayerState.titlescreen
			
			if (x != obj_parent_player.x)
				image_xscale = sign(obj_parent_player.x - x)
			
			sprite_index = spr_throw
		}
	}
}

if (state == PlayerState.charge)
	grav = 0.5
else
	grav = 0

if (state == PlayerState.frozen)
	state = EnemyStates.float

event_inherited()

if (state != PlayerState.titlescreen)
	scr_scareenemy()
