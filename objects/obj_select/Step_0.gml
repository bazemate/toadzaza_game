scr_key_step()

if keyLeft_once && selected_world != 0
	selected_world -= 1;
	
if keyRight_once && selected_world != 1
	selected_world += 1;
	
if keyUp_once && selected != 0
	selected -= 1;
	
if keyDown_once && selected != 3
	selected += 1;
	
if keyJump_once
{	
	global.intro_room = levels[selected_world][selected][1];
	global.world = selected_world + 1;
	global.level = selected + 1;
	room_goto(rm_intro)
}