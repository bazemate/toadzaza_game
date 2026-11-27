function scr_global(){
	global.gameover = false;
	global.highscore = 0;
	global.coins = 0;
	global.intro_room = world1_1;
	global.world = 1;
	global.level = 1;
	global.font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ*!.-",0,0)
	global.scorefont = font_add_sprite_ext(spr_scorefont,"0123456789",0,0)
}
