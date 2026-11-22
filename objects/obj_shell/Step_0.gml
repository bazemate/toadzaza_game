scr_collision()

if stomp_timer != 0
	stomp_timer -= 0;

switch state
{
	case 0:
		hsp = 0
		
		if place_meeting(x,y,obj_player)
		{
			with obj_player
				vsp = keyJump ? -7 : -4;
				
			state = 1
			stomp_timer = 10;
			play_sound(sfx_stomp)
		}
		break;
	case 1:
		hsp = 4 * image_xscale	
		
		if place_meeting(x + (image_xscale * 10),y,obj_solid) && hsp != 0
			image_xscale = -image_xscale
		
		if place_meeting(x,y,obj_player) && stomp_timer == 0
		{
			if obj_player.state != states.grow || obj_player.state != states.shrink
			{
				if place_meeting(x,y - 1,obj_player) && obj_player.state == states.jump
				{
					with obj_player
					vsp = keyJump ? -7 : -4;
				
					state = 0
					stomp_timer = 10;
					play_sound(sfx_stomp)
					global.highscore += 50
					with instance_create_depth(x,y,depth,obj_scoretext)
						score_text = 50;
				}
				else
				{
					scr_trigger_gameover();
				}
			}
		}
		break;
}	