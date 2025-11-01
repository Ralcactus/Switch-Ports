if (room == rm_title || room == rm_results || room == rm_disclaimer)
{
    app_resize = false;
    surface_resize(application_surface, 1920, 1080);
}
else
{
    app_resize = true;
    surface_resize(application_surface, 1408, 1080);
}
