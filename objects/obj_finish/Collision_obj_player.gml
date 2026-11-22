with obj_player 
{
	state = states.finishprep
	vsp = 0
	hsp = 0
}

if audio_is_playing(sfx_stop_loop)
	audio_stop_sound(sfx_stop_loop)

if audio_is_playing(mu_world1)
	audio_stop_sound(mu_world1)
	
instance_destroy(self)