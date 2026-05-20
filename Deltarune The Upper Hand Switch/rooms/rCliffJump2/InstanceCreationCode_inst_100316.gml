op.parameter = [0, room_width - 640, 0, room_height - 480];
op.camMode = "player";
ow_music(mus_stars_of_destiny);
audio_stop_sound(mus_Memories_Of_HQ);
instance_destroy(oFollow);
create_char("sock", 40, 320, sSock_Jockey, 0);
create_char("ralsei", 600, 320, sRalsei_Left, 0);
