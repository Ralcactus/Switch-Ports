depth = -3;

revealCondition = function()
{
    return place_meeting(x, y, obj_player);
};

secretAlpha = 1;
secretSurface = noone;
revealActivated = false;

// Layer Setup
for (var i = 0; i < array_length(layerArray); i++)
{
    var arg = layerArray[i];
    var layerid = layer_get_id(arg);
    layer_set_visible(layerid, false);
    layerArray[i] = layerid;
}

// Sort Array
var _f = function(elm1, elm2) 
{
	return -(layer_get_depth(elm1) - layer_get_depth(elm2));
}

array_sort(layerArray, _f);
