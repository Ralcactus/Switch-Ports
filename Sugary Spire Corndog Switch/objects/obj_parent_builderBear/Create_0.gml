depth = 10;
image_speed = 1;
scr_collision_init();
movespeed = 0;
verticalMovespeed = 0;
grav = 0.5;
state = UnknownEnum.Value_0;
scr_taunt_storeVariables();
randomBufferMin = 80;
randomBufferMax = 50;
randomBuffer = randomBufferMin + irandom(randomBufferMax);

switch (character)
{
    case UnknownEnum.Value_0:
        idleSprite = spr_builderBear_ted_idle;
        walkSprite = spr_builderBear_ted_walk;
        panicSprite = spr_builderBear_ted_panic;
        tauntSprite = spr_builderBear_ted_taunt;
        break;
    
    case UnknownEnum.Value_1:
        idleSprite = spr_builderBear_tedAlt_idle;
        walkSprite = spr_builderBear_tedAlt_walk;
        panicSprite = spr_builderBear_ted_panic;
        tauntSprite = spr_builderBear_ted_taunt;
        break;
    
    case UnknownEnum.Value_2:
        idleSprite = spr_builderBear_sarah_idle;
        walkSprite = spr_builderBear_sarah_walk;
        panicSprite = spr_builderBear_sarah_panic;
        tauntSprite = spr_builderBear_sarah_taunt;
        break;
    
    case UnknownEnum.Value_3:
        idleSprite = spr_builderBear_jack;
        walkSprite = spr_builderBear_jack;
        panicSprite = spr_builderBear_jack;
        tauntSprite = spr_builderBear_jack;
        break;
    
    case UnknownEnum.Value_4:
        idleSprite = spr_builderBear_karen_idle;
        walkSprite = spr_builderBear_karen_idle;
        panicSprite = spr_builderBear_karen_panic;
        tauntSprite = spr_builderBear_karen_taunt;
        break;
}
