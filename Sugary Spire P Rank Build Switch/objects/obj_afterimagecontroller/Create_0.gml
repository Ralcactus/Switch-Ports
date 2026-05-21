enum afterimages 
{
	fade = 0,
	blue = 1,
	pink = 2,
	orange = 3,
	solid_blue = 4,
	solid_pink = 5,
	solid_orange = 6,
	enemy = 7,
}

depth = 1;
color_arr[afterimages.fade] = { light : c_white, dark : c_black }
color_arr[afterimages.blue] = { light : #30a8f8, dark : #0f3979 }
color_arr[afterimages.pink] = { light : #e85098, dark : #5f0920 }
color_arr[afterimages.orange] = { light : #f87018, dark : #a84000 }
color_arr[afterimages.solid_blue] = { light : #30a8f8, dark : #30a8f8 }
color_arr[afterimages.solid_pink] = { light : #e85098, dark : #e85098 }
color_arr[afterimages.solid_orange] = { light : #f87018, dark : #f87018 }
color_arr[afterimages.enemy] = { light : #e03000, dark : #e03000 }
global.BlinkTrail = false;
blinkingBuffer = 3;
