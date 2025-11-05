selected = 0;
zoomtrans = 0;
zoomedin = false;
zoomxpan = 0;
zoomypan = 0;
image_speed = 0.07;
concepts = array_create(0);

for (var _sprind = 0; sprite_exists(_sprind); _sprind++)
{
    var _sprname = sprite_get_name(_sprind);
    
    if (string_starts_with(_sprname, "co_"))
        array_push(concepts, _sprname);
}

array_sort(concepts, true);
