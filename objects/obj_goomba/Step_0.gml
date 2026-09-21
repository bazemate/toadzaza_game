event_inherited();

hsp = ((global.gameover == true) ? 0 : -0.4 * image_xscale) // this is so stupid oh my fucking god

if place_meeting(x,y,obj_player)
{
	if place_meeting(x,y - 1,obj_player) && obj_player.state == states.jump
	{
		with obj_player
			vsp = keyJump ? -7 : -4;
		
		play_sound(sfx_stomp);
		instance_destroy(self);
		instance_create_depth(x,y,depth,obj_goomba_death);
	}
	else
	{
		scr_trigger_gameover();
	}
}