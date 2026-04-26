grav = 0.5;
hspCarry += slideHsp;
scr_collide_destructibles();

if (state != UnknownEnum.Value_2 && state != UnknownEnum.Value_132 && state != UnknownEnum.Value_134 && state != UnknownEnum.Value_72 && state != UnknownEnum.Value_57 && state != UnknownEnum.Value_56 && state != UnknownEnum.Value_27 && state != UnknownEnum.Value_49)
    scr_collision();

scr_getinput();
inputBufferJump = key_jump ? 15 : max(inputBufferJump - 1, 0);
inputBufferSlap = key_slap2 ? 12 : max(inputBufferSlap - 1, 0);
coyoteTime = (grounded && vsp >= 0) ? 8 : max(coyoteTime - 1, 0);

if (vsp < 0)
    coyoteTime = 0;

can_jump = (grounded && vsp > 0) || (!grounded && coyoteTime > 0 && vsp > 0);
cutscene = state == UnknownEnum.Value_72 || state == UnknownEnum.Value_56 || state == UnknownEnum.Value_57 || state == UnknownEnum.Value_49;
isInSecretPortal = false;

if (grounded && vsp >= 0 && state != UnknownEnum.Value_11 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_37 && state != UnknownEnum.Value_70 && state != UnknownEnum.Value_30 && state != UnknownEnum.Value_86)
{
    var target_angle = 360;
    var rotation_step = -((abs(hsp) / 16) - 2);
    
    if (abs(hsp) >= 8 || state == UnknownEnum.Value_100)
    {
        target_angle = scr_slopeangle();
        rotation_step = -(((abs(hsp) / 16) + (abs(hsp) / 32)) - 2);
    }
    
    slopeAngle = darctan2(dsin(target_angle) + (dsin(slopeAngle) * rotation_step), dcos(target_angle) + (dcos(slopeAngle) * rotation_step));
}
else
{
    if (slopeAngle <= 0)
        slopeAngle += 360;
    
    if (slopeAngle < 180)
        slopeAngle = lerp(slopeAngle, 0, 0.25);
    else
        slopeAngle = lerp(slopeAngle, 360, 0.25);
    
    slopeAngle = round(slopeAngle);
}

draw_angle = slopeAngle;
draw_angle = 0;
scr_playerstate();
