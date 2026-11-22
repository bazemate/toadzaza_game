scr_init_collision()
grav = 0
visible = false;

state = 0 //0 = freezed,1 = prep,2 = go

shroom_xscale = 1
shroom_yscale = 1
frame = 10

meet_player = function() {
	if place_meeting(x,y,obj_player)
	{
		if obj_player.hp == 1
		{
			with obj_player	
			{
				hp += 1;
				image_index = 0
				sprite_index = p_grow;
				image_speed = 0.4;
				state = states.grow;
			}
		}
		global.highscore += 1000
		with instance_create_depth(x,y,depth,obj_scoretext)
			score_text = 1000;
		play_sound(sfx_hpup,false,1)
		instance_destroy(self);
	}	
}

alarm_set(0,20)
alarm_set(1,80)