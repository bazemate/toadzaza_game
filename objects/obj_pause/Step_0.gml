if keyboard_check_pressed(vk_escape)
{
	paused = -paused;
	if paused == 1
	{
		screen_save("paused.png")
		pause_spr = sprite_add("paused.png", 1, false, false, 0, 0)
		file_delete("paused.png")
		instance_deactivate_all(true)
		audio_pause_all()
		pause_alphaGOTO = 1
	}
	else 
	{
		if (sprite_exists(pause_spr)) {
			sprite_delete(pause_spr)
			pause_spr = -4
		}
		instance_activate_all()
		audio_resume_all()
		pause_alphaGOTO = 0
	}	
	play_sound(sfx_pause,false,0.7)
}

pause_alpha = approach(pause_alpha,pause_alphaGOTO,0.1)
