if (audio_emitter_exists(audio))
    audio_emitter_free(audio);

if (surface_exists(surf))
    surface_free(surf);

if (surface_exists(surf_splash))
    surface_free(surf_splash);

if (surface_exists(surf_map))
    surface_free(surf_map);

if (texturegroup_get_status(texture_group) == 3)
    texture_flush(texture_group);
