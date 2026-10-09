scr_init_collision();
scr_key_create();
scr_player_sprite_create();
movespeed = 0;
last_movespeed = movespeed;
move = 0; //for keys
depth = 1;
_direction = 1;
touched = 0;
hp = 1;
_default =
{
	jump : -5,
	walk : 2,
	run : 3
}
enum states {
	idle,
	jump,
	turn,
	bounce,
	slide,
	grow
}
state = states.idle
timer = 
{
	bounce_anim : 0,
	slide : 0
};