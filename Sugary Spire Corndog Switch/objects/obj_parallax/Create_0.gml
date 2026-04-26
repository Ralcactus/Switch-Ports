depth = -5;
global.ScrollOffset = 0;

if (instance_number(obj_parallax) > 1)
{
    var _first = instance_find(obj_parallax, 0);
    
    if (id != _first)
    {
        instance_destroy();
        exit;
    }
}

layerArray = [];
var i = 5;

repeat (5)
    layers[i--] = -4;

asset_layers = array_create(5, undefined);
asset_sprites = array_create(5, undefined);
layerNum = 0;
assetNum = 0;
spriteNum = 0;
target_panic_id = 0;
target_time_id = 0;
bgflash = 0;
greyscalefade = 0;
scroll1 = 0;
RealSurface = -4;
use_war = false;

safe_layer_set_depth = function(arg0, arg1)
{
    if (layer_exists(arg0) && number_in_range(arg1, -16000, 16000))
        layer_depth(arg0, arg1);
};

set_layer_depths = function()
{
    var temp_map = ds_map_create();
    ds_map_set(temp_map, "Tiles_Foreground", 50);
    ds_map_set(temp_map, "Tiles_", 100);
    ds_map_set(temp_map, "Tiles_BG", 200);
    ds_map_set(temp_map, "Assets_BG", 210);
    ds_map_set(temp_map, "Assets_FG", -350);
    ds_map_set(temp_map, "Assets_Foreground", -350);
    ds_map_set(temp_map, "Effect_", -500);
    var a = layer_get_all();
    
    for (var i = 0; i < array_length(a); i++)
    {
        var layer_id = a[i];
        var layer_name = layer_get_name(layer_id);
        var nums = string_digits(layer_name);
        var nums_at = string_last_pos(nums, layer_name);
        var layer_check_name = (nums == "") ? layer_name : string_delete(layer_name, nums_at, real(nums));
        trace(string("LAYER {0}, NUMS: {1}, CHECK: {2}, NUMS POS: {3}", layer_name, nums, layer_check_name, nums_at));
        
        if (!is_undefined(ds_map_find_value(temp_map, layer_check_name)))
        {
            var sub = (string_digits(layer_name) == "") ? 0 : real(string_digits(layer_name));
            safe_layer_set_depth(a[i], ds_map_find_value(temp_map, layer_check_name) - sub);
            trace(string("LAYER {0}, CHECK: {1}, DEPTH: {2}", layer_name, layer_check_name, ds_map_find_value(temp_map, layer_check_name) - sub));
        }
    }
    
    ds_map_destroy(temp_map);
};
