function audio(){

}

function play_sound(sound,loop = false,gain = 0.5)
{
	audio_play_sound(sound,10,loop,gain)	
}

function play_sound_pitch(sound,pitch = 1,loop = false,gain = 0.5)
{
	audio_play_sound(sound,10,loop,gain,0,pitch)	
}