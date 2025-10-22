function smf_samplestrip(arg0, arg1) constructor
{
    static create_sample = function(arg0)
    {
        return update_sample(arg0, array_create(rig.boneNum * 8, 0), true);
    };
    
    static update_sample = function(arg0, arg1, arg2 = true)
    {
        var timeDiv = floor(arg0);
        
        if (arg0 != 0 && arg0 == timeDiv)
            arg0 = 1;
        else
            arg0 -= timeDiv;
        
        if (anim.interpolation == (0 << 0))
        {
            var g = anim.keyframeGrid;
            var lastKeyframe = anim.keyframeNum - 1;
            var i = round(arg0 * lastKeyframe);
            var diff = abs(ds_grid_get(g, 0, i) - arg0);
            
            while (i < lastKeyframe)
            {
                var d = abs(ds_grid_get(g, 0, i + 1) - arg0);
                
                if (d > diff)
                    break;
                
                diff = d;
                i++;
            }
            
            while (i > 0)
            {
                var d = abs(ds_grid_get(g, 0, i - 1) - arg0);
                
                if (d > diff)
                    break;
                
                diff = d;
                i--;
            }
            
            var sample = get_sample(i);
            array_copy(arg1, 0, sample, 0, array_length(sample));
            return arg1;
        }
        
        var timer = arg0 * steps;
        var pos = floor(timer);
        var sample1 = get_sample(pos);
        
        if (!arg2 || frac(timer) == 0)
        {
            array_copy(arg1, 0, sample1, 0, array_length(sample1));
            return arg1;
        }
        
        var sample2 = get_sample(pos + 1);
        return sample_lerp(sample1, sample2, frac(timer), arg1);
    };
    
    static get_sample = function(arg0)
    {
        var sample = strip[arg0];
        
        if (!is_array(sample))
        {
            var steps = array_length(strip) - 1;
            var itpl = anim.interpolation;
            
            if (itpl == (0 << 0))
            {
                time = ds_grid_get(anim.keyframeGrid, 0, arg0);
                sample = anim.generate_sample(rig, time);
                strip[arg0] = sample;
                return sample;
            }
            
            var time = arg0 / steps;
            sample = anim.generate_sample(rig, time);
            strip[arg0] = sample;
            var nodeList = rig.nodeList;
            var nodeNum = ds_list_size(nodeList);
            var keyframeArray = -1;
            
            for (var i = 0; i < nodeNum; i++)
            {
                var node = ds_list_find_value(nodeList, i);
                
                if (!node[(11 << 0)])
                    continue;
                
                switch (itpl)
                {
                    case (1 << 0):
                        if (!is_array(keyframeArray))
                            keyframeArray = anim.keyframe_get_linear(time);
                        
                        var posA = anim.keyframe_get_node_position(rig, keyframeArray[0], i);
                        var posB = anim.keyframe_get_node_position(rig, keyframeArray[1], i);
                        var newX = lerp(posA[0], posB[0], keyframeArray[2]);
                        var newY = lerp(posA[1], posB[1], keyframeArray[2]);
                        var newZ = lerp(posA[2], posB[2], keyframeArray[2]);
                        sample_node_move(rig, i, sample, newX, newY, newZ, true, false);
                        break;
                    
                    case (2 << 0):
                        if (!is_array(keyframeArray))
                            keyframeArray = anim.keyframe_get_quadratic(time);
                        
                        var posA = anim.keyframe_get_node_position(rig, keyframeArray[0], i);
                        var posB = anim.keyframe_get_node_position(rig, keyframeArray[1], i);
                        var posC = anim.keyframe_get_node_position(rig, keyframeArray[2], i);
                        var newX = smf_quadratic_interpolate(posA[0], posB[0], posC[0], keyframeArray[3]);
                        var newY = smf_quadratic_interpolate(posA[1], posB[1], posC[1], keyframeArray[3]);
                        var newZ = smf_quadratic_interpolate(posA[2], posB[2], posC[2], keyframeArray[3]);
                        sample_node_move(rig, i, sample, newX, newY, newZ, true, false);
                        break;
                }
            }
        }
        
        return sample;
    };
    
    static get_nearest_frame = function(arg0)
    {
        if (anim.interpolation == (0 << 0))
        {
            var g = anim.keyframeGrid;
            var lastKeyframe = anim.keyframeNum - 1;
            var i = floor(arg0 * lastKeyframe);
            
            while (i < lastKeyframe && ds_grid_get(g, 0, i + 1) < arg0)
                i++;
            
            var t = ds_grid_get(g, 0, i);
            
            while (i > 0 && t > arg0)
                t = ds_grid_get(g, 0, --i);
            
            return get_sample(i);
        }
        
        return get_sample(round(arg0 * steps));
    };
    
    rig = arg0;
    anim = arg1;
    steps = (anim.interpolation == (0 << 0)) ? anim.keyframeNum : (anim.keyframeNum * anim.sampleFrameMultiplier);
    strip = array_create(steps + 1);
    keyframe = anim.interpolation == (0 << 0);
}

function samplestrip_create(arg0, arg1)
{
    return new smf_samplestrip(arg0, arg1);
}

function samplestrip_create_sample(arg0, arg1)
{
    return arg0.create_sample(arg1);
}

function samplestrip_update_sample(arg0, arg1, arg2, arg3)
{
    return arg0.update_sample(arg1, arg2, arg3);
}

function samplestrip_get_sample(arg0, arg1)
{
    return arg0.get_sample(arg1);
}

function samplestrip_get_anim(arg0)
{
    return arg0.anim;
}

function samplestrip_get_frame(arg0, arg1)
{
    return arg0.get_nearest_frame(arg1);
}

function samplestrip_get_rig(arg0)
{
    return arg0.rig;
}

function samplestrip_write_to_buffer(arg0, arg1)
{
    var strip = arg1.strip;
    var steps = arg1.steps;
    buffer_write(arg0, buffer_string, "SnidrsSampleStrip");
    rig_write_to_buffer(arg0, arg1.rig);
    anim_write_to_buffer(arg0, arg1.anim);
    buffer_write(arg0, buffer_u32, steps);
    var num = arg1.rig.boneNum * 8;
    
    for (var i = 0; i <= steps; i++)
    {
        var sample = strip[i];
        
        if (!is_array(sample))
        {
            sample = anim_generate_sample(arg1.rig, arg1.anim, i / steps);
            strip[i] = sample;
        }
        
        for (var j = 0; j < num; j++)
            buffer_write(arg0, buffer_f32, sample[j]);
    }
}

function samplestrip_read_from_buffer(arg0)
{
    var header = buffer_read(arg0, buffer_string);
    
    if (header != "SnidrsSampleStrip")
        show_debug_message("Error in script samplestrip_read_from_buffer:  Trying to read from a section that does not contain a samplestrip.");
    
    var rig = rig_read_from_buffer(arg0);
    var anim = anim_read_from_buffer(arg0);
    var sampleStrip = new samplestrip(rig, anim);
    var steps = buffer_read(arg0, buffer_u32);
    var strip = array_create(steps + 1);
    var num = rig.boneNum * 8;
    sampleStrip.strip = strip;
    
    for (var i = 0; i <= steps; i++)
    {
        var sample = array_create(num);
        
        for (var j = 0; j < num; j++)
            sample[j] = buffer_read(arg0, buffer_f32);
        
        strip[i] = sample;
    }
    
    return sampleStrip;
}
