draw_set_alpha(intro_alpha)

draw_set_color(c_black)
draw_rectangle(0,0,256,224,false)
draw_set_color(c_white)

draw_set_font(global.font)
draw_set_halign(fa_center)
draw_text(slide_x,64,world_text)
draw_sprite(p_idle,0,slide_x2 - 16,90);
draw_text(slide_x2 + 16,90,"X3")
draw_text_wave(slide_x,112,level_text,6,100,1,fa_center);

draw_set_alpha(1)