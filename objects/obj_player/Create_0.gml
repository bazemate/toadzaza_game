scr_init_collision();
scr_key_create();
movespeed = 0;
last_movespeed = movespeed;
move = 0; //for keys
depth = 1;
_direction = 1;
touched = 0;
_default =
{
	jump : -5,
	walk : 2,
	run : 4
}
enum states {
	idle,
	jump,
	turn
}
state = states.idle