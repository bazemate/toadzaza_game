function scr_keyshit(){

}

function scr_key_create()
{
	keyLeft = 0;
	keyRight = 0;
	keyLeft_once = 0;
	keyRight_once = 0;
	keyUp_once = 0
	keyDown = 0;
	keyDown_once = 0;
	keyJump = 0;
	keyJump_once = 0;
	keyRun = 0;
}

function scr_key_step()
{
	keyLeft = keyboard_check(vk_left);
	keyRight = keyboard_check(vk_right);
	keyLeft_once = keyboard_check_pressed(vk_left);
	keyRight_once = keyboard_check_pressed(vk_right);
	keyUp_once = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check(vk_down);
	keyDown_once = keyboard_check_pressed(vk_down);
	keyJump = keyboard_check(ord("Z"));
	keyJump_once = keyboard_check_pressed(ord("Z"));
	keyRun = keyboard_check(ord("X"));
}