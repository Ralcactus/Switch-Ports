event_inherited();
anim_init();
facing = 1;
face_sprite = spr_platform_cloud_face;
face_ind = 0;
image_xscale = 3.6;

event_oof = function()
{
    if (face_sprite == spr_platform_cloud_face)
    {
        face_sprite = spr_platform_cloud_face_oof;
        face_ind = 0;
    }
};

event_face_animend = function()
{
    var _spr = face_sprite;
    
    if (_spr == spr_platform_cloud_face_oof)
    {
        face_sprite = spr_platform_cloud_face;
        face_ind = 0;
    }
};
