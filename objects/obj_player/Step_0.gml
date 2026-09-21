scr_key_step();
scr_collision();

move = (keyRight - keyLeft);
hsp = movespeed * image_xscale;

switch state
{
	case states.idle:
		if movespeed != 0
			sprite_index = p_walk;
		else
			sprite_index = p_idle;
			
		image_speed = (movespeed / 10);
	
		if (move != 0)
		{
			if !place_meeting(x + move,y,obj_solid)
				movespeed = approach(movespeed,((keyRun) ? _default.run : _default.walk),0.1);
			else	
				movespeed = 0;
				
			if (movespeed > 2)
			{
				if (move == (-image_xscale))
				{
					play_sound(sfx_stop_start);
					last_movespeed = movespeed;
					state = states.turn	
				}
			} 
			else
			{
				image_xscale = move;	
			}
		}
		else
			movespeed = approach(movespeed,0,0.1);

		if keyJump_once && grounded
		{
			play_sound(sfx_jump);
			vsp = (keyRun) ? (_default.jump * 1.25) : _default.jump;
			state = states.jump;
		}
		
		break;
	case states.jump:
		sprite_index = p_jump;
		
		if place_meeting(x + move,y,obj_solid)
			touched = 1;
		
		if (move != 0)
		{
			movespeed = approach(movespeed,(touched ? 0 : ((keyRun) ? _default.run : _default.walk) * (image_xscale * move)),0.05);
		}
		else
			movespeed = approach(movespeed,0,0.1);
		
		if !keyJump && !grounded && vsp < 0
			vsp /= 20;
		
		if grounded
		{
			state = states.idle;
			touched = 0;
		}
		break;
	case states.turn:
		sprite_index = p_turn;
		
		if !audio_is_playing(sfx_stop_start)
		{
			if !audio_is_playing(sfx_stop_loop)
				play_sound(sfx_stop_loop)
		}
		
		if movespeed != (last_movespeed - 1)
			movespeed = approach(movespeed,last_movespeed - 1,0.05)
		else
		{
			state = states.idle
			image_xscale = -image_xscale
		}
		
		if keyJump_once && grounded
		{
			play_sound(sfx_jump);
			vsp = (keyRun) ? (_default.jump * 1.25) : _default.jump;
			state = states.jump;
		}
		break;
}