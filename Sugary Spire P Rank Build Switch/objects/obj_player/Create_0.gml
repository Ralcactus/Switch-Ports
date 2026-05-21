scr_collision_init();
scr_playersounds_init();
lastroom = noone;
upsideDownJump = false;
terminalVelocity = 20;
slideHsp = 0;
can_jump = 0;
secret_array = [];
oldComboTitle = 0;
blue_aftimg = 0;
mach_aftimg = 0;
my_pal_surface = noone;
my_pal_buffer = noone;

my_palettes = [];
new_palette("Default", #ffffff, #88a8c8)
new_palette("Sugar", #28d080, #1f935c)
new_palette("Gremlin", #f8e080, #d88818)
new_palette("Golden", #efb916, #b76300, #efb916, #b76300, #b76300, #efb916)
new_palette("Purple", #9850f8, #9850f8)
new_palette("Cream n' Chips", spr_pattern0, #88a8c8)
new_palette("Valiant Hero", spr_pattern1, #88a8c8)
new_palette("Dead Man's Treats", spr_pattern2, #88a8c8)
new_palette("Candy Cane", spr_pattern3, #88a8c8)
new_palette("Sweet Apple", spr_pattern4, #88a8c8)
new_palette("Space Cream", spr_pattern5, #88a8c8)
new_palette("Sourness", spr_pattern6, #88a8c8)
new_palette("Neapolitan", spr_pattern7, #88a8c8)
new_palette("Cookie Cutter", spr_pattern8, #88a8c8)
new_palette("MissingTexture", spr_pattern9, #88a8c8)
new_palette("Solid", spr_pattern10, #88a8c8)
// found commented out in march, still not used in p rank
// but the texture still exists, so you could add it
// new_palette("Chocoa", spr_pattern11, #88a8c8)
new_palette("Cotton Candy", spr_pattern12, #88A8C8);

combo_title = noone;
scr_initinput();
scr_getinput();
playerSound = audio_emitter_create(); //everything related to this was stolen from antonblast :(
//Stored Stuff
frozenstate = 0;
frozenspriteindex = spr_file2;
frozenimageindex = 0;
frozenimagespeed = 0.35;
frozenmovespeed = 0;
frozengrav = 0.35;
frozensmash = 0;
frozenhsp = 0;
frozenvsp = 0;
frozenjumpbuffer = 0;
frozenalarm[0] = -1;
frozenalarm[1] = -1;
frozenalarm[2] = -1;
frozenalarm[3] = -1;
frozenalarm[4] = -1;
frozenalarm[5] = -1;
frozenalarm[6] = -1;
frozenalarm[7] = -1;
frozenalarm[8] = -1;
frozenalarm[9] = -1;
frozenalarm[10] = -1;

costumeBlock = noone;
costumeBlockDetails = 0;
costumegrabdelay = 10;
angle = 0;
dummyBlock = noone;
bombID = noone;
shaketime = 3;
breezecooldown = 25;

secretPortal = false;
is_inSecretPortal = false;
global.dialogmsg = ds_queue_create();

sourbuddycnt = 0;
chuckcooldown = 120;
secreteye = 0;
ufovsp = 0;
//Generic Input Buffer variable
ridingmarsh = 0;
input_buffer = 0;
//Cone block stuff
global.coneblock = false;
//Sjumpcancel
scale = 1;
Sjumpcan_doublejump = true;
firetrailbuffer = 0;
playComboVariable = noone;
//Variable that Resets contTrack_pos
ResetMusic = false;
//Variable that makes the Dashpad not suck
Dashpad_buffer = 0;
//Supertaunt
supertauntbuffer = 300;
supertaunteffect = noone;
supertauntcharged = false;
//Vertical hallway
vertical = false;
verticaloffset = 0;
stateName = "";
groundpoundEffect = noone;
dashCloudID = noone;
superDashCloudID = noone;
mach4mode = 0;
doublejump = 0;
global.saveroom = ds_list_create();
global.timetrial = false;
grav = 0.5;
hsp = 0;
vsp = 0;
xscale = 1;
yscale = 1;
facehurt = 1;
steppy = 0;
grabclimbbuffer = 0;
crouchslipbuffer = 0;
stop = 0;
storedhsp = 0;
depth = -7;
movespeed = 19; //???
jumpstop = 0;
storedinhalebaddie = 0;
visible = true;
inhalingenemy = false;
state = states.titlescreen;
jumpAnim = 1;
landAnim = 0;
machslideAnim = 0;
moveAnim = 1;
stopAnim = 1;
crouchslideAnim = 1;
crouchAnim = 1;
machhitAnim = 0;
stompAnim = 0;
inv_frames = 0;
gumbobpropellerlength = 100;
gumbobpropellercooldown = 200;
hurted = 0;
canrebound = 0;
autodash = 0;
mach2 = 0;
input_buffer_jump = 8;
input_buffer_slap = 0;
input_buffer_secondjump = 8;
input_buffer_highjump = 8;
player_x = x;
player_y = y;
supergrabx = 0;
supergraby = 0;
targetRoom = rm_preinitializer;
flash = 0;
kungfutrail = 5;
walljump = false;
walljump_buffer = 0;
//Heateffect
heataftereffect_id = noone;
parryid = noone;
global.key_inv = 0;
global.mallowfollow = 0;
global.crackfollow = 0;
global.chocofollow = 0;
global.wormfollow = 0;
global.candyfollow = 0;
global.keyget = 0;
global.collect = 0;
global.ammo = 0;
global.treasure = 0;
global.combo = 0;
global.highestcombo = 0;
global.roomsave = 0;
global.combotime = 0;
global.pizzacoin = 0;
global.toppintotal = 1;
global.hit = 0;
global.combofreeze = 0;
global.combolost = 0;
global.baddieroom = ds_list_create();
global.escaperoom = ds_list_create();
global.waterincaninv = 0;
key_particles = 0;
barrel = 0;
bounce = 0;
a = 0;
idle = 0;
attacking = 0;
slamming = 0;
superslam = 0;
grounded = true;
groundedSlope = false;
grinding = 0;
machpunchAnim = 0;
punch = 0;
flushedstoredmovespeed = 0;
machfreefall = 0;
shoot = 1;
isflushed = 0;
instakillmove = 0;
windingAnim = 0;
facestompAnim = 0;
ladderbuffer = 0;
toomuchalarm1 = 0;
toomuchalarm2 = 0;
bushdetection = 0;
idleanim = 0;
momemtum = 0;
cutscene = 0;
grabbing = 0;
dir = xscale;
dir2 = yscale;
shotgunAnim = 0;
goingdownslope = 0;
goingupslope = 0;
fallinganimation = 0;
bombpeptimer = 100;
suplexmove = 0;
suplexhavetomash = 0;
breakdanceammo = 0;
anger = 0;
angry = 0;
character = "P";
baddiegrabbedID = noone;
scr_characterspr();
paletteselect = 0;
global.panic = 0;
colorchange = 0;
treasure_x = 0;
treasure_y = 0;
treasure_room = 0;
verticalMovespeed = 0;
taunttimer = 20;
scr_taunt_storeVariables();
global.golfhit = 0;
global.funmode = 0;
swingdingbuffer = 0;
lastmove = 0;
hurtbounce = 0;
targetDoor = "A";
roomstartx = xstart;
roomstarty = ystart;
hallway = 0;
box = 0;
//pizzano variables
airkung = 0;
kungtime = 0;
pummelani = 0;
pummelhit = 0;
pummelfinish = 0;
global.cane = 0;
jumpspeed = 0;
freefallsmash = 0;
drill = 1;
bouncespeed = 0;
bounced = 0;
groundedcot = 0;
sourbuddied = 0;
sour_buddies = ds_list_create();
sour_buddies_timer = 60;
unlatchcount = 0;
unlatchtimer = 0;
//New Palette
surf_width = 2;
surf_height = 10;
surf_pallete = -1;

if (!surface_exists(surf_pallete))
    surf_pallete = surface_create(surf_width, surf_height);
//CustomPaletteChoosyFILE
actor = false;
customsavedpalette = 1;
oldcustomsavedpalette = 1;
characters = "Pizzelle";
colorheight = 8;
palettewave = false;
custompalette = false;
customupdate = true;
inhaling = 0;
inhalestrength = 0;
freefallsmash = 0;
draw_angle = 0;
slope_angle = 0;
doublejumped = 0;
charged = 0;
headless = 0;
slidejumpSpeed = 0;
substate = 0;
playedjumpsound = 0;
doublejump = 0;
playerPrevState = 0;
playerPrevSprite = spr_idle;
//Achievment stuff
kungaircount = 0;
kungairtime = 0;
disguisetimer = 0;
check = 0;
seacream_stick_buffer = 0;
hp = 6;
ufotimer = 0;
ufotimer = 0;
ufomaxspeed = 0;
additionalspeedvar = 0;
pattern = false;
patternspr = spr_pattern0;
patternnumb = 0;

u_mask = shader_get_uniform(shd_pattern, "u_MaskColour");
u_spr = shader_get_uniform(shd_pattern, "u_SprRect");
u_pat = shader_get_uniform(shd_pattern, "u_PatRect");
u_texel = shader_get_uniform(shd_pattern, "u_TexelScl");
u_offset = shader_get_uniform(shd_pattern, "u_SprOffset");
