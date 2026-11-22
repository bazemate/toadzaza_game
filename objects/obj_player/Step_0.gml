scr_key_step();
scr_collision();
scr_player_timer();
scr_player_sprite_manager();

move = (keyRight - keyLeft);
if state != states.grow
	hsp = movespeed * image_xscale;

switch state
{
	case states.idle:
		if movespeed != 0
			sprite_index = s_walk;
		else
			sprite_index = s_idle;
		
		mask_index = s_mask
		image_speed = (movespeed / 10);
	
		if (move != 0 && !place_meeting(x + move,y,obj_solid))
			movespeed = approach(movespeed,((keyRun) ? _default.run : _default.walk),0.2);	
		else
			movespeed = approach(movespeed,0,0.2);

		if (move == (-image_xscale))
		{
			if movespeed > _default.walk
				play_sound(sfx_stop_start);
			
			last_movespeed = movespeed;
			state = states.turn	
		}

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
		if sprite_index == s_jump_angle
		{
			image_angle += 20;
			sprite_index = s_jump_angle;
			mask_index = s_jump_mask;
		}
		else	
		{
			image_angle = 0;
			sprite_index = s_jump;
			mask_index = s_mask;
		}
		
		
		if (move != 0)
			movespeed = approach(movespeed,(((keyRun) ? _default.run : _default.walk) * (image_xscale * move)),0.2);
		else
			movespeed = approach(movespeed,0,0.2);
		
		if !keyJump && !grounded && vsp < 0
			vsp /= 20;
		
		if grounded
		{
			state = states.idle;
			touched = 0;
			image_angle = 0;
			mask_index = s_mask;
			if sprite_index == s_jump_angle
				y = y + 7;
			
			if move != 0
				image_xscale = move;
			
			if move == -image_xscale
				movespeed = -movespeed;
		}
		break;
	case states.turn:
		sprite_index = s_turn;
		mask_index = s_mask
		if movespeed > _default.walk
		{
			if !audio_is_playing(sfx_stop_start)
			{
				if !audio_is_playing(sfx_stop_loop)
					play_sound(sfx_stop_loop)
			}
		}
		if movespeed != 0
			movespeed = approach(movespeed,0,0.25)
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
		mask_index = s_mask
		if !grounded
		{
			if timer.bounce_anim == 0
				sprite_index = s_bounce_loop;
			else	
				sprite_index = s_bounce;
				
			if keyDown_once
				vsp /= 40;
			
			if keyJump_once
			{
				sprite_index = s_jump_angle;
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
		sprite_index = s_slide;
		mask_index = s_mask
		if (!keyDown && timer.slide == 0) || place_meeting(x + hsp,y,obj_solid)
			state = states.idle;
		
		if keyJump_once
		{
			sprite_index = s_jump_angle;
			play_sound(sfx_bounce);
			play_sound(sfx_jump);
			vsp = (keyRun) ? (_default.jump * 1.25) : _default.jump;
			state = states.jump;
		}
		break;
	case states.grow:
		hsp = 0
		vsp = 0
		grav = 0
		mask_index = s_mask
		if (image_index >= image_number - 1)
		    image_speed = 0
		else 
			image_speed = 0.4;
		
		if !audio_is_playing(sfx_hpup)
		{
			state = states.idle;
			grav = 0.2
		}
		
		break;
	case states.shrink:
		hsp = 0
		vsp = 0
		grav = 0
		mask_index = s_mask
		if (image_index >= image_number - 1)
		    image_speed = 0
		else 
			image_speed = 0.4;
		
		if !audio_is_playing(sfx_shrink)
		{
			state = states.idle;
			grav = 0.2
			timer.inv = 100;
			global.stop = false;
		}
		
		break;
	case states.finishprep:
		hsp = 0
		if grounded
		{
			state = states.finish;
			timer.finish = 20;
		}
		break;
		
	case states.finish:
		switch finish_anim
		{
			case 0:
				hsp = 0
				sprite_index = s_idle;
				if timer.finish == 0
				{
					timer.finish = 60;
					play_sound(mu_complete)
					finish_anim += 1;
				}
				break;
			case 1:
				hsp = 3
				sprite_index = s_walk;
				image_speed = 0.2
				if timer.finish == 0
				{
					timer.finish = 40;
					finish_anim += 1;
				}
				break;
			case 2:
				hsp = 0
				sprite_index = s_idle;
				if timer.finish == 0
				{
					timer.finish = 80;
					play_sound(sfx_toadzaza_yahoo,false,2)
					finish_anim += 1;
				}
				break;
			case 3:
				hsp = 0
				sprite_index = s_finish;
				if (image_index >= image_number - 1)
				    image_speed = 0
				else 
					image_speed = 0.4;
				if timer.finish == 0
				{
					timer.finish = 40;
					finish_anim += 1;
				}
				break;
			case 4:
				hsp = 2
				sprite_index = s_walk;
				image_speed = 0.2
				if timer.finish == 0
				{
					timer.finish = 30;
					finish_anim += 1;
				}
				break;
			case 5:
				hsp = 0
				visible = false;
				break;
		}

		
		
		break;
}

if timer.inv != 0
	image_alpha = 0.5;
else
	image_alpha = 1;