global.music_map = ds_map_create();
global.secret_room = false;
global.secretmusic = noone;

/// @desc Function Description
/// @param {Asset.GMRoom} room The Room to change music in.
/// @param {Asset.GMSound} song The main level song.
/// @param {Asset.GMSound} secret_song The secret song.
/// @param {bool} continuous Boolean to toggle between continuous syncing between tracks.
/// @param {function} function Function to handle advanced music switches.
function add_music(rm, song, secret_song, cont, func = undefined) 
{
	var b = 
	{
		music : song,
		secret_music : secret_song,
		continuous : cont,
		my_func : func,
	}
	global.music_map[? rm] = b;
}

museffect = 0;
pausedmusic = 0;
prevmuID = noone;
target_gain = 1;
contTrack_pos = 0;
GummyBear = false;
music = undefined;
// How to change Escape Music
// By default, the escape themes are the character's respective escape themes, but changing the escapemusic variable will override those from playing
// To set escape theme, simply set the escape music variable to whichever song you choose 
// For escape theme loops, do [escape music, loop start, loop end]
escapemusic = noone;
default_escapemusic = mu_escape;
musicGain = 1;
force_continuous = false;
unforce_continuous = false;
ignore_change = false;
hard_force = false;
musicfadein = 0;

// Room to change, Normal Music, Secret Music, Continuous, Loop Begin, Loop End (undefined is default)
room_details = 
{
    music: noone,
    secret_music: noone,
    continuous: false,
    my_func: undefined
};
add_music(rm_disclaimer, mu_gummyharry, mu_painter, 0);
add_music(rm_introVideo, noone, mu_painter, 0);
add_music(devroom, mu_what, mu_painter, 0);
add_music(rm_missing, mu_void, mu_painter, 0);
add_music(realtitlescreen, mu_title, mu_painter, 0);
add_music(hub_w1, mu_hubw1, mu_painter, 1);
add_music(hub_w2, mu_hubw2, mu_painter, 1);
add_music(rm_credits, mu_credits, mu_painter, 0);
add_music(tutorial_1, mu_tutorial, mu_painter, 0);
add_music(entryway_1, mu_waffle, mu_wafflesecret, 0);
add_music(steamy_1, mu_steamy, mu_steamysecret, 0);
add_music(steamy_7, mu_steamy, mu_steamysecret, 1);
add_music(steamy_8, mu_steamyinner, mu_steamysecret, 1);
add_music(molasses_1, mu_swamp1, mu_swampsecret, 0);
add_music(molasses_6, mu_swamp1, mu_swampsecret, 1);
add_music(molasses_6b, mu_swamp2, mu_swampsecret, 1);
add_music(mines_1, mu_mineshaft1, mu_minessecret, 0, function()
{
    if (global.minesProgress && obj_player.state == states.victory)
        return mu_void;
    else if (global.minesProgress)
        return mu_mineshaft2;
    else
        return mu_mineshaft1;
});
add_music(mines_6, mu_mineshaft2, mu_minessecret, 0);
add_music(mineshaft_1, mu_mineshaft1, mu_minessecret, 0);
add_music(mountain_intro, mu_mountain1, mu_mountainsecret, 0);
add_music(mountain_5, mu_mountain1, mu_mountainsecret, 1);
add_music(mountain_6, mu_mountain2, mu_mountainsecret, 1);
add_music(dance_1, mu_dance2, mu_dancesecret, 0);
add_music(dance_8, mu_dance2, mu_dancesecret, 1);
add_music(dance_9, mu_dance, mu_dancesecret, 1);
add_music(sucrose_1, mu_sucrose, mu_sucrosesecret, 0);
add_music(estate_1, mu_estate, mu_estatesecret, 0);
add_music(estate_6, mu_estate, mu_estatesecret, 1);
add_music(estate_dog, mu_gummyharry, mu_estatesecret, 1);
add_music(bee_1, mu_martian, mu_what, 0);
audio_sound_loop_start(mu_waffle, 34.9);
audio_sound_loop_end(mu_waffle, 218.18);
audio_sound_loop_start(mu_steamy, 8);
audio_sound_loop_end(mu_steamy, 144);
