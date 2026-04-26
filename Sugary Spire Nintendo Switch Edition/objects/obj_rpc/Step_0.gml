if (!global.gamePauseState)
{
	if (global.InternalLevelName != "tutorial" && room != rm_mainmenu && room != rm_introVideo && !is_hub() && room != rank_room)
	{
		presenceDetails.state = string("{0} | Rank {1}", global.Collect, global.currentrank)
		presenceDetails.smallImg = string("rank_{0}", string_lower(global.currentrank))
		presenceDetails.smallImgText = string("Rank {0}", global.currentrank)
	}
	else
	{
		presenceDetails.state = ""
		presenceDetails.smallImg = ""
		presenceDetails.smallImgText = ""
	}
}

np_setpresence_more(presenceDetails.smallImgText, presenceDetails.largeImgText, false)
np_setpresence(presenceDetails.state, presenceDetails.details, presenceDetails.largeImg, presenceDetails.smallImg)
np_update()
