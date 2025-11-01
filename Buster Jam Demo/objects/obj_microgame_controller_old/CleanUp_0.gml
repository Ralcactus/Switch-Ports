if (surface_exists(surf))
    surface_free(surf);

if (surface_exists(surf_splash))
    surface_free(surf_splash);

if (surface_exists(surf_timer))
    surface_free(surf_timer);

if (bg != -4)
    instance_destroy(bg);

if (audio_emitter_exists(audio))
    audio_emitter_free(audio);
