u_playerpos = shader_get_uniform(shd_holecutout_premultiply, "u_PlayerPos");
u_radius = shader_get_uniform(shd_holecutout_premultiply, "u_Radius");
maxrad = max(global.maxscreenwidth / 2, global.maxscreenheight / 2) * 1.3;
rad = maxrad;
state = 0;
depth = -12500;
