video_open("gamedata/intro.mp4");
video_set_volume(global.musicVolume);
scr_initinput();
showText = false;
displayVideo = false;

//switch
vol = 1;
video_width = 480;
video_height = 446;
video_sampler = shader_get_sampler_index(shdVideo, "v_chroma");

