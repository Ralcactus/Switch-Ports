bgm = bgm_mapgame;
bpm = 150;
bgm_play = audio_play_sound(bgm, 0, 0);
audio_pause_sound(bgm_play);
events = [
{
    time: 6.4,
    hit: 0,
    ind: 0
}, 
{
    time: 9.6,
    hit: 0,
    ind: 1
}, 
{
    time: 12.8,
    hit: 0,
    ind: 0
}, 
{
    time: 14.4,
    hit: 0,
    ind: 1
}, 
{
    time: 16,
    hit: 0,
    ind: 0
}, 
{
    time: 17.6,
    hit: 0,
    ind: 1
}, 
{
    time: 19.2,
    hit: 0,
    ind: 0
}, 
{
    time: 20,
    hit: 0,
    ind: 0
}, 
{
    time: 22.4,
    hit: 0,
    ind: 1
}, 
{
    time: 23.2,
    hit: 0,
    ind: 1
}, 
{
    time: 28.8,
    hit: 0,
    ind: 0
}, 
{
    time: 29.6,
    hit: 0,
    ind: 1
}, 
{
    time: 32,
    hit: 0,
    ind: 0
}, 
{
    time: 38.4,
    hit: 0,
    ind: 1
}, 
{
    time: 39.2,
    hit: 0,
    ind: 0
}, 
{
    time: 35.2,
    hit: 0,
    ind: 1
}, 
{
    time: 40,
    hit: 0,
    ind: 1
}, 
{
    time: 40.8,
    hit: 0,
    ind: 0
}, 
{
    time: 41.6,
    hit: 0,
    ind: 1
}, 
{
    time: 42,
    hit: 0,
    ind: 1
}, 
{
    time: 43.2,
    hit: 0,
    ind: 1
}, 
{
    time: 43.6,
    hit: 0,
    ind: 1
}, 
{
    time: 44.4,
    hit: 0,
    ind: 0
}, 
{
    time: 36,
    hit: 0,
    ind: 1
}, 
{
    time: 32.8,
    hit: 0,
    ind: 0
}, 
{
    time: 50.8,
    hit: 0,
    ind: 1
}, 
{
    time: 50.8,
    hit: 0,
    ind: 0
}];
scroll_y = 0;
played_at = 0;
