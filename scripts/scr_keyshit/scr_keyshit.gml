function scr_keyshit(){

}

function scr_key_create()
{
	keyLeft = 0;
	keyRight = 0;
	keyJump = 0;
	keyJump_once = 0;
	keyRun = 0;
}

function scr_key_step()
{
	keyLeft = keyboard_check(vk_left);
	keyRight = keyboard_check(vk_right);
	keyJump = keyboard_check(ord("Z"));
	keyJump_once = keyboard_check_pressed(ord("Z"));
	keyRun = keyboard_check(ord("X"));
}