p1Vibration(3, 3)
instance_create(x, y, obj_bangEffect)
event_play_multiple("event:/SFX/general/clutterhit", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2))
dvsp = random_range(-7, -10)
dhsp = random_range(5, 10) * DestroyedBy.image_xscale
spinspeed = random_range(5, 10) * DestroyedBy.image_xscale
instance_destroy()
