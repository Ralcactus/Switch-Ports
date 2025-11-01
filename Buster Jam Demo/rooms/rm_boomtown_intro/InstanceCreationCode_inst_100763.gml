cutscene = obj_map_cutscene_boomtown_opening;

if (array_contains(global.save_data.cutscenes_watched, "boomtown_opening"))
{
    instance_destroy();
    exit;
}
