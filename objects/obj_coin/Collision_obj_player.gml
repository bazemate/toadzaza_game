if audio_is_playing(sfx_coin)
	audio_stop_sound(sfx_coin);
play_sound(sfx_coin,false,1)
global.coins += 1;
global.highscore += 200;
instance_destroy(self);