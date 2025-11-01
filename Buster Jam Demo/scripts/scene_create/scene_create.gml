function scene_create(arg0, arg1 = -4, arg2 = true)
{
    var _scene = instance_create_layer(0, 0, "GUI", obj_scene_manager);
    _scene.scene = arg0;
    _scene.ID_start = arg1;
    _scene.fade_textbox_out = arg2;
    return _scene;
}
