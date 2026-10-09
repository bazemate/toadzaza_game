if audio_is_playing(sfx_coin)
	audio_stop_sound(sfx_coin);
play_sound(sfx_coin,false,1)
instance_destroy(self);