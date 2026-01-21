// obj_load alarm[1]:
/// @description Phase 2 (Model Loading)

if (array_length(modellist) > 0)
{
    loadedassets++;

    var _modelname = array_pop(modellist);

    if (is_array(_modelname))
    {
        var _basename = _modelname[0];
        variable_struct_set(global.altMaterials, _basename, {});

        for (var _i = 0; _i < array_length(_modelname); _i++)
        {
            var _library = "_altmat_lib_";
            var _name = -1;

            if (_i <= 0)
            {
                var _path = "Data/ModelData/" + _basename + ".obj";
                var _m = DotobjModelLoadFile(_path);

                if (_m == undefined)
                {
                    trace("Phase 2: FAILED to load model " + _basename + " @ " + _path);
                    _name = -1;
                    _library = "_altmat_lib_";
                }
                else
                {
                    global.loadedModels[? _basename] = _m;
                    global.loadedModels[? _basename].Freeze();

                    var _mats = global.loadedModels[? _basename].GetMaterials();
                    if (is_array(_mats) && array_length(_mats) > 0)
                    {
                        var _mat = array_get(_mats, 0);
                        _name = _mat.name;
                        _library = _mat.library;
                    }
                    else
                    {
                        trace("Phase 2: WARNING no materials found for " + _basename);
                        _name = -1;
                        _library = "_altmat_lib_";
                    }

                    trace(string("Phase 2: Loaded Model {0}", _basename));
                }
            }
            else
            {
                var _mtl_path = working_directory + "Data/ModelData/" + _modelname[_i] + ".mtl";
                _name = import_material("_altmat_lib_", _mtl_path);
                _library = "_altmat_lib_";

                if (_name == -1)
                    trace("Phase 2: FAILED to import material " + string(_modelname[_i]) + " @ " + _mtl_path);
            }

            if (_name == -1)
                trace(string("Phase 2: Error Loading Model/Material {0}", _modelname[_i]));

            variable_struct_set(global.altMaterials, array_get(_modelname, _i),
            {
                model: _basename,
                library: _library,
                material: _name
            });
        }
    }
    else
    {
        var _path = working_directory + "Data/ModelData/" + _modelname + ".obj";
        var _m = DotobjModelLoadFile(_path);

        if (_m == undefined)
        {
            trace("Phase 2: FAILED to load model " + _modelname + " @ " + _path);
        }
        else
        {
            global.loadedModels[? _modelname] = _m;
            global.loadedModels[? _modelname].Freeze();
            trace(string("Phase 2: Loaded Model {0}", _modelname));
        }
    }

    alarm[1] = 1;
}
else
{
    trace("Loading: Phase 2 Finished");
    trace("Loading: Begin Phase 3 (3D Tile Generation)");
    alarm[2] = 1;
}
