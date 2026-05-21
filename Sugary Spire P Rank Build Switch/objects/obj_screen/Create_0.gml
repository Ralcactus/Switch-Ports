application_surface_draw_enable(false);
finalApplicationSurface = noone;
finalApplicationSurfBuffer = -1;

nextPowTwo = function(X)
{
    return power(2, ceil(log2(X) / log2(2)));
};

var surfW = 960;
var surfH = 540;
var wScalar = nextPowTwo(surfW);
var hScalar = nextPowTwo(surfH);
uRes = shader_get_uniform(shd_pixelscale, "uRes");
sRes = [wScalar, hScalar];
