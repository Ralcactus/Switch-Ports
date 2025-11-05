vBuffMap = array_create(0, -1);
map_surf = array_create(5, -1);
main_surf = -1;

maptrans_size = shader_get_uniform(shd_maptransition, "u_Size");
maptrans_anim = shader_get_uniform(shd_maptransition, "u_Animation");
maprender_colour = shader_get_uniform(shd_maprender, "u_Colour");
mapstyle_texel = shader_get_uniform(shd_mapstyle, "u_Texel");
mapstyle_offset = shader_get_uniform(shd_mapstyle, "u_Offset");
mapstyle_uvs = shader_get_uniform(shd_mapstyle, "u_UVs");
mapstyle_outlinecol = shader_get_uniform(shd_mapstyle, "u_OutlineCol");

patternscroll = 0;

openanim = 0;
closeanim = 0;

zoomclicktimer = 0;
zoompitch = 5;
zoomclick = event_instance("event:/sfx/misc/mapzoomclick");
depth = -13000;

roomoffset[0] = new Vec2(0, 0);
roomoffset[1] = new Vec2(115, -95);
roomoffset[2] = new Vec2(280, -61);
roomoffset[3] = new Vec2(47, -321);
roomoffset[4] = new Vec2(23, -224);
roomoffset[5] = new Vec2(248, -373);
roomoffset[6] = new Vec2(-64, -319);
roomoffset[7] = new Vec2(-97, -533);

roomorder = [0, 1, 2, 3, 4, 5, 6, 7];

roomgreyout[0] = false;
roomgreyout[1] = false;
roomgreyout[2] = false;
roomgreyout[3] = true;
roomgreyout[4] = true;
roomgreyout[5] = true;
roomgreyout[6] = true;
roomgreyout[7] = true;

roomcorners = array_create(0);
mapcorners = [new Vec2(-1, -1), new Vec2(-1, -1)];
visitedrooms = array_create(array_length(global.levelrooms) - 4, false);
global.mapOpen = false;
zoom = 0;

panx = 0;
pany = 0;

swaplayer = false;
canswap = false;
layera = false;
invcharge = 0;
outhouse = -1;

playerroom = 0;
playerposx = 0;
playerposy = 0;

outhoused = false;

checkposx = 0;
checkposy = 0;

roominfo_pumpkins = array_create(0);
roominfo_crates = array_create(0);
roominfo_nitros = array_create(0);
roominfo_outhouses = array_create(0);

outhouse_queue = [];

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();
global.vFormatMap = vertex_format_end();
