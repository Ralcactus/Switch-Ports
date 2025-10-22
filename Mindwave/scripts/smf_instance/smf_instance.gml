function smf_instance(arg0) constructor
{
    static step = function(arg0)
    {
        if (currAnimInd < 0 && currAnimName != "")
        {
            var animInd = ds_map_find_value(model.animMap, currAnimName);
            newAnimInd = is_undefined(animInd) ? -1 : animInd;
        }
        
        if (currAnimInd < 0 && newAnimInd < 0)
        {
            sample_update_bind(model.rig, sample);
            exit;
        }
        
        if (currAnimInd >= 0)
        {
            if (fastSampling)
            {
                sample = sampleStrip.get_nearest_frame(timer);
            }
            else
            {
                sampleStrip.update_sample(timer, sample, smooth);
                
                if (animLerp < 1)
                {
                    animLerp = min(1, animLerp + (lerpSpd * arg0));
                    sample_lerp(prevSample, sample, animLerp, sample);
                }
            }
        }
        
        if (newAnimInd >= 0)
        {
            timer = newTimer;
            anim = model.animations[newAnimInd];
            sampleStrip = model.sampleStrips[newAnimInd];
            
            if (!is_struct(sampleStrip))
            {
                sampleStrip = new smf_samplestrip(model.rig, anim);
                model.sampleStrips[newAnimInd] = sampleStrip;
            }
            
            if (currAnimInd >= 0)
            {
                animLerp = 0;
                array_copy(prevSample, 0, sample, 0, array_length(sample));
            }
            
            if (currAnimInd < 0 || (lerpSpd * arg0) >= 1)
            {
                sampleStrip.update_sample(newTimer, sample, smooth);
                animLerp = 1;
            }
            
            currAnimInd = newAnimInd;
            newAnimInd = -1;
        }
        
        if (currAnimInd >= 0)
        {
            var spd = animSpeed;
            
            if (animSpeed == -1)
                spd = anim.playSpeed;
            
            if (anim.loop)
                timer = frac(timer + (spd * arg0) + 1);
            else
                timer = clamp(timer + (spd * arg0), 0, 1);
        }
    };
    
    static set_sample_from_keyframe = function(arg0, arg1)
    {
        var animInd = ds_map_find_value(model.animMap, arg0);
        
        if (is_undefined(animInd))
            return false;
        
        var anim = model.animations[animInd];
        var time = ds_grid_get(anim.keyframeGrid, 0, arg1);
        var strip = model.sampleStrips[animInd];
        
        if (!is_struct(strip))
        {
            strip = new smf_samplestrip(model.rig, anim);
            model.sampleStrips[animInd] = strip;
        }
        
        strip.update_sample(time, sample, false);
        return true;
    };
    
    static _draw = function()
    {
        model.submit(sample);
    };
    
    static fast_sampling = function(arg0)
    {
        if (arg0 && !fastSampling)
            backupSample = sample;
        
        if (!arg0 && fastSampling)
            sample = backupSample;
        
        fastSampling = arg0;
    };
    
    static play = function(arg0, arg1, arg2, arg3)
    {
        currAnimName = arg0;
        var animInd = ds_map_find_value(model.animMap, arg0);
        lerpSpd = arg2;
        animSpeed = arg1;
        
        if (is_undefined(animInd))
        {
            show_debug_message("Error in SMF instance's function \"play\": Could not find animation " + string(arg0));
            return -1;
        }
        
        if (!arg3 && currAnimInd == animInd)
            exit;
        
        newAnimInd = animInd;
        newTimer = (1 - arg3) * frac(timer);
    };
    
    static lerp_sample = function(arg0, arg1, arg2)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_lerp(arg0.sample, arg1.sample, arg2, sample);
    };
    
    static splice_branch = function(arg0, arg1, arg2)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_splice_branch(model.rig, arg1, sample, arg0.sample, arg2);
    };
    
    static node_yaw = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_yaw(model.rig, arg0, sample, degtorad(arg1), true);
    };
    
    static node_pitch = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_pitch(model.rig, arg0, sample, degtorad(arg1), true);
    };
    
    static node_roll = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_roll(model.rig, arg0, sample, degtorad(arg1), true);
    };
    
    static node_rotate = function(arg0, arg1, arg2, arg3, arg4)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_rotate_axis(model.rig, arg0, sample, degtorad(arg1), arg2, arg3, arg4, true);
    };
    
    static node_rotate_x = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_rotate_x(model.rig, arg0, sample, degtorad(arg1));
    };
    
    static node_rotate_y = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_rotate_y(model.rig, arg0, sample, degtorad(arg1));
    };
    
    static node_rotate_z = function(arg0, arg1)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_rotate_z(model.rig, arg0, sample, degtorad(arg1));
    };
    
    static node_drag = function(arg0, arg1, arg2, arg3, arg4)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_drag(model.rig, arg0, sample, arg1, arg2, arg3, arg4);
    };
    
    static node_move_ik = function(arg0, arg1, arg2, arg3, arg4, arg5)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_move(model.rig, arg0, sample, arg1, arg2, arg3, arg4, arg5);
    };
    
    static node_move_ik_fast = function(arg0, arg1, arg2, arg3, arg4, arg5)
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        sample_node_move_fast(model.rig, arg0, sample, arg1, arg2, arg3, arg4, arg5);
    };
    
    static node_get_dq = function(arg0)
    {
        return sample_get_node_dq(model.rig, arg0, sample);
    };
    
    static node_get_matrix = function(arg0)
    {
        return sample_get_node_matrix(model.rig, arg0, sample);
    };
    
    static node_get_position = function(arg0)
    {
        return sample_get_node_position(model.rig, arg0, sample);
    };
    
    static get_animation = function()
    {
        if (currAnimInd < 0)
            return -1;
        
        var animArray = model.animations;
        return animArray[currAnimInd];
    };
    
    static get_animation_time = function()
    {
        var ind = (newAnimInd > 0) ? newAnimInd : currAnimInd;
        
        if (ind < 0)
            return 0;
        
        var animArray = model.animations;
        var anim = animArray[ind];
        return (anim.playTime / 1000) * game_get_speed(gamespeed_fps);
    };
    
    static fix = function()
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        return sample_fix(model.rig, sample);
    };
    
    static normalize = function()
    {
        if (fastSampling)
        {
            show_debug_message("Error in SMF instance: Can't edit fast-sampling instance!");
            return true;
        }
        
        return sample_normalize(sample);
    };
    
    model = arg0;
    anim = -1;
    timer = 0;
    smooth = true;
    animLerp = 1;
    lerpSpd = 0.2;
    animSpeed = 0;
    sampleStrip = -1;
    currAnimInd = -1;
    currAnimName = "";
    fastSampling = false;
    sample = -1;
    prevSample = -1;
    backupSample = -1;
    newAnimInd = -1;
    newTimer = 0;
    sample = sample_create_bind(model.rig);
    prevSample = sample_create_bind(model.rig);
}

function smf_instance_create(arg0)
{
    return new smf_instance(arg0);
}

function smf_instance_play_animation(arg0, arg1, arg2, arg3, arg4)
{
    arg0.play(arg1, arg2, arg3, arg4);
}

function smf_instance_lerp(arg0, arg1, arg2, arg3)
{
    arg3.lerp_sample(arg0, arg1, arg2);
}

function smf_instance_splice_branch(arg0, arg1, arg2, arg3)
{
    arg0.splice_branch(arg1, arg2, arg3);
}

function smf_instance_node_yaw(arg0, arg1, arg2)
{
    arg0.node_yaw(arg1, arg2);
}

function smf_instance_node_pitch(arg0, arg1, arg2)
{
    arg0.node_pitch(arg1, arg2);
}

function smf_instance_node_roll(arg0, arg1, arg2)
{
    arg0.node_roll(arg1, arg2);
}

function smf_instance_node_rotate_axis(arg0, arg1, arg2, arg3, arg4, arg5)
{
    arg0.node_rotate(arg1, arg2, arg3, arg4, arg5);
}

function smf_instance_node_rotate_x(arg0, arg1, arg2)
{
    arg0.node_rotate_x(arg1, arg2);
}

function smf_instance_node_rotate_y(arg0, arg1, arg2)
{
    arg0.node_rotate_y(arg1, arg2);
}

function smf_instance_node_rotate_z(arg0, arg1, arg2)
{
    arg0.node_rotate_z(arg1, arg2);
}

function smf_instance_node_drag(arg0, arg1, arg2, arg3, arg4, arg5)
{
    arg0.node_drag(arg1, arg2, arg3, arg4, arg5);
}

function smf_instance_node_move_ik(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    arg0.node_move_ik(arg1, arg2, arg3, arg4, arg5, arg6);
}

function smf_instance_node_move_ik_fast(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    arg0.node_move_ik_fast(arg1, arg2, arg3, arg4, arg5, arg6);
}

function smf_instance_step(arg0, arg1)
{
    arg0.step(arg1);
}

function smf_instance_draw(arg0)
{
    arg0._draw();
}

function smf_instance_enable_fast_sampling(arg0, arg1)
{
    arg0.fast_sampling(arg1);
}

function smf_instance_set_animation_speed(arg0, arg1)
{
    arg0.animSpeed = arg1;
}

function smf_instance_set_smooth(arg0, arg1)
{
    arg0.smooth = arg1;
}

function smf_instance_set_timer(arg0, arg1)
{
    arg0.timer = arg1;
}

function smf_instance_get_node_dq(arg0, arg1)
{
    return arg0.node_get_dq(arg1);
}

function smf_instance_get_node_matrix(arg0, arg1)
{
    return arg0.node_get_matrix(arg1);
}

function smf_instance_get_node_position(arg0, arg1)
{
    return arg0.node_get_position(arg1);
}

function smf_instance_get_sample(arg0)
{
    return arg0.sample;
}

function smf_instance_get_timer(arg0)
{
    return arg0.timer;
}

function smf_instance_get_animation(arg0)
{
    return arg0.get_animation();
}

function smf_instance_get_fast_sampling(arg0)
{
    return arg0.fastSampling;
}
