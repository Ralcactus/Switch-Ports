if (col == 2)
{
    pipe_idle = spr_pipe_purple;
    bom_spr = spr_bom_purple;
}
else if (col == 1)
{
    pipe_idle = spr_pipe_green;
    bom_spr = spr_bom_green;
}
else
{
    pipe_idle = spr_pipe_orange;
    bom_spr = spr_bom_orange;
}

if (!set_sprite)
{
    anim_sprite = pipe_idle;
    set_sprite = true;
}
