function scr_player_timer()
{
	if timer.bounce_anim != 0
		timer.bounce_anim -= 1;
		
	if timer.slide != 0
		timer.slide -= 1;
		
	if timer.inv != 0
		timer.inv -= 1;
		
	if timer.finish != 0
		timer.finish -= 1;
}