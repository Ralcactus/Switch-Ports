if (splitsound != noone)
    event_replay(splitsound, x, y);

playedsound = true;
var _sp = world_to_screen(x, y, z, obj_drawcontroller.viewMat, obj_drawcontroller.projMat);

with (instance_create_depth(_sp[0] + irandom_range(-particlespread, particlespread), _sp[1] + irandom_range(-particlespread, particlespread), obj_drawcontroller.depth - 100, obj_collectparticle))
{
    if (other.particlespr != noone)
    {
        if (!is_array(other.particlespr))
            sprite_index = other.particlespr;
        else
            sprite_index = other.particlespr[irandom(array_length(other.particlespr) - 1)];
    }
    else
        sprite_index = other.sprite_index;
    
    image_speed = other.image_speed;
    image_index = other.image_index;
    value = other.value / other.splitfactor;
}

global.collect += (other.value / other.splitfactor);
combo();
obj_drawcontroller.collectatimer = 120;
splittimer = splittime;
splitcounter++;

if (splitcounter >= splitfactor && collectedspr == noone)
    instance_destroy();
