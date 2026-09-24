if bump == 2
{
	fake_y = ystart;
	if place_meeting(x,y + 1,obj_player)
	{
		if obj_player.state == states.jump
		{
			with obj_player
				vsp /= 20;
			bump = -2;
		}
	}
}

if bump != 2
{
	fake_y += bump;
	bump = min(bump + 0.3, 2);
}