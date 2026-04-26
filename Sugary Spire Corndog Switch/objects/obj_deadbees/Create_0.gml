image_alpha = 0.5;
image_speed = 0.35;

if (global.lapcount <= 0)
    instance_destroy();

timer = 0;
beecount = choose(2, 3);

for (var i = 0; i < beecount; i++)
{
    beey[i] = 0;
    beepos[i] = [x + random_range(-48, 48), y + random_range(-48, 48)];
}
