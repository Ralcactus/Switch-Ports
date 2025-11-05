depth += 4;
z = depth;
lightlevel = 1;
do_specific(function()
{
    var _pumpkins = string_get("pumpkins");
    var _individual = _pumpkins[irandom(array_length(_pumpkins) - 1)];
    face = _individual[irandom(array_length(_individual) - 2) + 1];
});
image_speed = 0.35;
