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
			frame = 0
			play_sound(sfx_bump)
			if place_meeting(x,y - 1,shroom_id)
			{
				with shroom_id
				{
					vsp = -4;
				}
			}
		}
	}
}

if bump != 2
{
	fake_y += bump;
	bump = min(bump + 0.3, 2);
}

frame += 0.1;
block_xscale = ease_out_elastic(frame,2,1 - 2,5);
block_yscale = ease_out_elastic(frame,0.25,1 - 0.25,5);