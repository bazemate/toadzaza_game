function scr_trigger(){

}

function scr_trigger_gameover(silent = false){
	with obj_player
	{
		with obj_camera 
			last_x = other.x;
			
		if audio_is_playing(sfx_stop_loop)
			audio_stop_sound(sfx_stop_loop);
			
		if audio_is_playing(mu_world1)
			audio_stop_sound(mu_world1);
				
		play_sound(sfx_death);
			
		instance_create_depth(x,y,depth,silent == false ? obj_player_gameover : obj_silent_gameover);
		instance_destroy(self);
	}
	global.gameover = true;
}

function scr_trigger_shrink(){
	with obj_player
	{
		if audio_is_playing(sfx_stop_loop)
			audio_stop_sound(sfx_stop_loop);
				
		play_sound(sfx_shrink,false,2);
		global.stop = true;
		
		hp -= 1;
		image_index = 0
		sprite_index = p_shrink;
		image_speed = 0.4;
		state = states.shrink;
	}
}