audiencespr = spr_rankaudience_idle;
audienceind = 0;
fade = 1;
totalscore = global.collect;
totalpumpkins = global.pumpkintotal;
cratesmissed = global.cratecount - global.destroyedcount;
totalgems = global.gems;
scorecount = 0;
pumpkincount = 0;
crateshit = 0;
scoreshake = 0;
pumpkinshake = 0;
crateshake = 0;
signshake = 0;
curgem = 0;
gemcount = 0;
advancetimer = -1;
cratesmashtime = 10;
scorecounttime = 1;
noisespr = spr_player_rankidle;
noiseind = 0;
totalsigny = -400;
totalsignvsp = 0;
totalsignbounced = false;
ranksigny = -224;
state = states.normal;
countsndtimer = 0;

enum Rank
{
	Perfect = 0,
	Good = 1,
	Meh = 2,
	Shit = 3,
}

rank = Rank.Shit;
signsqueak = event_instance("event:/sfx/misc/ranksignsqueak");
