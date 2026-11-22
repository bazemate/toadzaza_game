function scr_global(){
	global.gameover = false;
	global.highscore = 0;
	global.coins = 0;
	global.font = font_add_sprite_ext(spr_font,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ*!.-",0,0)
	global.scorefont = font_add_sprite_ext(spr_scorefont,"0123456789",0,0)
}
