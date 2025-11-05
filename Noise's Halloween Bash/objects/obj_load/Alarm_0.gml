///@description Phase 1 (Texture Loading)
if (array_length(texturelist) > 0)
{
    loadedassets++;
    texture_prefetch(array_pop(texturelist));
    alarm[0] = 1;
}
else
{
    trace("Loading: Phase 1 Finished");
    trace("Loading: Begin Phase 2 (Model Loading)");
    alarm[1] = 1;
}
