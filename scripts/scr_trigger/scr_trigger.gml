function scr_trigger(){

}

function scr_trigger_gameover(){
	with obj_player
	{
		with obj_camera 
			cam.last_x = other.x;
			
		if audio_is_playing(sfx_stop_loop)
			audio_stop_sound(sfx_stop_loop);
				
		play_sound(sfx_death);
			
		instance_create_depth(x,y,depth,obj_player_gameover);
		instance_destroy(self);
	}
	global.gameover = true;
}

