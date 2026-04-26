global.player_pal_surface = -4;
global.player_pal_buffer = -4;
global.player_pal_texture = -4;

function scr_player_palsurf_setup(arg0)
{
    if (!surface_exists(global.player_pal_surface))
        global.player_pal_surface = surface_create(sprite_get_width(spr_pal2), sprite_get_height(spr_pal2));
    
    if (!buffer_exists(global.player_pal_buffer))
    {
        show_debug_message("Player Palette: Buffer Created");
        
        if (surface_exists(global.player_pal_surface))
        {
            surface_set_target(global.player_pal_surface);
            draw_clear_alpha(c_black, 0);
            pal_swap_draw_palette(spr_pal2, 0, 0, 0);
            var real_colors = arg0.colors;
            
            for (var i = 0; i < array_length(real_colors); i++)
            {
                if (is_array(real_colors[i]))
                {
                    draw_set_alpha(real_colors[i][1]);
                    draw_point_color(1, i, real_colors[i][0]);
                }
                else
                {
                    draw_set_alpha(1);
                    draw_point_color(1, i, real_colors[i]);
                }
            }
            
            surface_reset_target();
        }
        
        global.player_pal_buffer = buffer_create(sprite_get_width(spr_pal2) * sprite_get_height(spr_pal2) * 4, buffer_fixed, 1);
        global.player_pal_texture = arg0.pattern;
        buffer_get_surface(global.player_pal_buffer, global.player_pal_surface, 0);
    }
    else
    {
        buffer_set_surface(global.player_pal_buffer, global.player_pal_surface, 0);
    }
}

function draw_player_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    scr_palette_as_player(arg0, arg1);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    pal_swap_reset();
}
