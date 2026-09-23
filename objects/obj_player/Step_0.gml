scr_key_step();
scr_collision();
scr_player_timer();

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
				
			if (movespeed > _default.walk)
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
		
		if (movespeed == _default.run)
		{
			if keyDown_once
			{
				play_sound(sfx_bounce);
				vsp = _default.jump + 2;
				state = states.bounce;
				timer.bounce_anim = 40;
			}
		}
		
		break;
	case states.jump:
		
		//temp
		if sprite_index == p_jump_angle
		{
			image_angle += 20;
			sprite_index = p_jump_angle;
			mask_index = p_jump_mask;
		}
		else	
		{
			image_angle = 0;
			sprite_index = p_jump;
			mask_index = p_mask;
		}
		
		if place_meeting(x + move,y,obj_solid)
			touched = 1;
		
		if (move != 0)
			movespeed = approach(movespeed,(touched ? 0 : ((keyRun) ? _default.run : _default.walk) * (image_xscale * move)),0.1);
		else
			movespeed = approach(movespeed,0,0.1);
		
		if !keyJump && !grounded && vsp < 0
			vsp /= 20;
		
		if grounded
		{
			state = states.idle;
			touched = 0;
			image_angle = 0;
			mask_index = p_mask;
			if sprite_index == p_jump_angle
				y = y + 7;
		}
		break;
	case states.turn:
		sprite_index = p_turn;
		
		if !audio_is_playing(sfx_stop_start)
		{
			if !audio_is_playing(sfx_stop_loop)
				play_sound(sfx_stop_loop)
		}
		
		if movespeed != (last_movespeed - 0.5)
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
	case states.bounce:
		
		if !grounded
		{
			if timer.bounce_anim == 0
				sprite_index = p_bounce_loop;
			else	
				sprite_index = p_bounce;
				
			if keyDown_once
				vsp /= 40;
			
			if keyJump_once
			{
				sprite_index = p_jump_angle;
				play_sound(sfx_jump);
				vsp = (keyRun) ? (_default.jump * 1.25) : _default.jump;
				state = states.jump;
			}
		}
		else
		{
			play_sound(sfx_slide)
			state = states.slide;
			timer.slide = 20;
		}
		break;
	case states.slide:
		sprite_index = p_slide;
		
		if (!keyDown && timer.slide == 0) || place_meeting(x + image_xscale,y,obj_solid)
			state = states.idle;
		
		if keyJump_once
		{
			sprite_index = p_jump_angle;
			play_sound(sfx_bounce);
			play_sound(sfx_jump);
			vsp = (keyRun) ? (_default.jump * 1.25) : _default.jump;
			state = states.jump;
		}
		break;
}