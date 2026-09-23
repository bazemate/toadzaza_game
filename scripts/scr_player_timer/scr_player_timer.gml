function scr_player_timer()
{
	if timer.bounce_anim != 0
		timer.bounce_anim -= 1;
		
	if timer.slide != 0
		timer.slide -= 1;
}