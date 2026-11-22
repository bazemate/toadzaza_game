if pause_spr != -4 {
	draw_set_color(c_white)
	draw_set_alpha(1)
	draw_sprite_stretched(pause_spr,0,0,0,256,224)
}
draw_set_color(c_black)
draw_set_alpha(pause_alpha - 0.6)
draw_rectangle(0,0,256,224,false)
draw_set_color(c_white)
draw_set_alpha(pause_alpha)
draw_text_wave(128,32,"PAUSED",6,100,2,fa_center)

draw_set_alpha(1)