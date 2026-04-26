var _check = (DestroyedBy.bbox_left > (x + 32) && sign(image_xscale) == 1) || (DestroyedBy.bbox_right < (x - 32) && sign(image_xscale) == -1);

if (_check && !(DestroyedBy.object_index == obj_parent_baddie && DestroyedBy.state == UnknownEnum.Value_7))
{
    if (DestroyedBy.object_index == obj_parent_player && ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == UnknownEnum.Value_55))
        DestroyedBy.vsp = 0;
    
    instance_destroy();
}
