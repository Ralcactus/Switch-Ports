function physics_apply_2d_micro()
{
    move[0] = 0;
    move[1] = 0;
    
    for (var i = 0; i < array_length(move_forces[0]); i++)
        move[0] += variable_instance_get(id, move_forces[0][i]);
    
    for (var i = 0; i < array_length(move_forces[1]); i++)
        move[1] += variable_instance_get(id, move_forces[1][i]);
    
    move[0] += hspd * global.delta_game_factor;
    move[1] += vspd * global.delta_game_factor;
    
    for (var c = 0; c < 2; c++)
    {
        move_sub[c] += move[c];
        move_calc[c] = round(move_sub[c]);
        move_sub[c] -= move_calc[c];
    }
    
    xmove_collide(move_calc[0]);
    ymove_collide(move_calc[1]);
    
    if (on_ground_micro())
        event_floor();
    
    if (((has_collision && !on_ground_micro()) || !has_collision) && has_gravity)
        vspd += (grav * global.delta_game_factor);
}
