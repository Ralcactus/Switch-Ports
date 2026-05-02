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

scr_playerstate();
