x += (hsp * dir_h)
y += (vsp * dir_v)
hsp = approach(hsp, 0, 0.25)
vsp = approach(vsp, 0, 0.25)
shake = random_range(-1, 1)
x += shake
y += shake
