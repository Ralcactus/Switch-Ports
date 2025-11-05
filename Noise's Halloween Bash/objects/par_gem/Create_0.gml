u_colour = shader_get_uniform(shd_gemshading, "u_Colour");
u_light = shader_get_uniform(shd_gemshading, "u_Light");
u_view = shader_get_uniform(shd_gemshading, "u_View");
u_lightlevel = shader_get_uniform(shd_gemshading, "u_LightLevel");
u_outlining = shader_get_uniform(shd_gemshading, "u_Outlining");

model = "Gem";
colour = #B3B3BF;
gemid = 0;
lightlevel = 1;
z = depth + 16;
depth = 16000;
