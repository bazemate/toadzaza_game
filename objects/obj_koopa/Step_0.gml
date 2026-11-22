event_inherited();

if distance_to_object(obj_player) <= 256
	hsp = (global.stop == true ? 0 : ((global.gameover == true) ? 0 : -0.6 * image_xscale)); // this is so stupid oh my fucking god
else
	hsp = 0;

if global.stop == false
{
	if place_meeting(x,y,obj_player)
	{
		if obj_player.state != states.grow || obj_player.state != states.shrink
		{
			if place_meeting(x,y - 1,obj_player) && obj_player.state == states.jump
			{
				with obj_player
					vsp = keyJump ? -12 : -7;
		
				play_sound(sfx_stomp);
				play_sound(sfx_kill)
				instance_destroy(self);
				global.highscore += 100
				with instance_create_depth(x,y,depth,obj_scoretext)
					score_text = 100;
			}
			else
			{
				if obj_player.timer.inv == 0
				{
					if obj_player.hp == 1
						scr_trigger_gameover();
					else
						scr_trigger_shrink();
				}
			}
		}
	}
}