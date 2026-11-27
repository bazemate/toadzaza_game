slide_x = -128
slide_x2 = 260
slide_xGOTO = 128
intro_alpha = 1
intro_alphaGOTO = 1

world_text = "WORLD 1 - HERE IT GOES"
level_text = "LEVEL 1-1 - THEM BASTARDS"

switch global.world
{
	case 1:
		world_text = "WORLD 1 - HERE IT GOES"
		if global.level == 1
			level_text = "LEVEL 1-1 - THEM BASTARDS";
		else if global.level == 2
			level_text = "LEVEL 1-2 - CAUTION AHEAD";
		else if global.level == 3
			level_text = "LEVEL 1-3 - I AM TIRED";
		else if global.level == 4
			level_text = "LEVEL 1-4 - KILLING IN PROGRESS";
		break;
	case 2:
		world_text = "WORLD 2 - SUNSET ALPEN"
		break;
	case 3:
		world_text = "WORLD 3 - I AM FREEZING AS SHIT"
		break;
	case 4:
		world_text = "WORLD 4 - BOWS' EXECUTION"
		break;
}

play_sound(mu_intro,false,0.7)

alarm_set(1,220)