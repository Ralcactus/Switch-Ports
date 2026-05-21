event_inherited();
image_speed = 0.35;
depth = -30;
state = bossstates.intro;
jumped = false;
dashed = false;
stunned = 0;
atk_details = [noone, noone, noone];
subattack_1 = noone;
subattack_2 = noone;
inv_time = 200;
bID = noone;
substate = 0;
intensity = 0;
delay = 120;
max_delay = 120;
stun_timer = 200;
setfordeath = false;
tgtNeg = 160;
tgtPos = 800;
thrown = false;
can_parry = true;
phase_atks = 
[
	[boss_create_attack(bossstates.painterdash, 0, 15)],
	[boss_create_attack(bossstates.painterlunge, 0, 15), boss_create_attack(bossstates.painterdash, 0, 10)],
	[boss_create_attack(bossstates.painterlunge, 0, 15), boss_create_attack(bossstates.painterdash, 1, 10)],
	[
		boss_create_attack(bossstates.painterlunge, 3, 15),
		boss_create_attack(bossstates.paintball, 0, 0),
		boss_create_attack(bossstates.vulnerable, 90, 30)
	],
	[
		boss_create_attack(bossstates.painterlunge, 5, 15),
		boss_create_attack(bossstates.paintball, 0, 0),
		boss_create_attack(bossstates.painterlunge, 5, 15),
		boss_create_attack(bossstates.paintball, 0, 0),
		boss_create_attack(bossstates.vulnerable, 90, 30)
	],
	[
		boss_create_attack(bossstates.painter_createenem, 396, [-4, 320], 1),
		boss_create_attack(bossstates.painterlunge, 1, 15),
		boss_create_attack(bossstates.painterlunge, 2, 15)
	]
];
