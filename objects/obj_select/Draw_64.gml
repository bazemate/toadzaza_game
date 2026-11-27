draw_set_font(global.font)
draw_set_halign(fa_left)
draw_text_wave(16,16,"LEVEL SELECT",5,100,2,fa_left)
draw_text(16,32,string_concat("WORLD ",selected_world + 1))

for (var i = 0; i < (array_length(levels[selected_world])); i++) {
	draw_text(16,64 + (16 * i),string_upper(levels[selected_world][i][0]))
}
draw_text(16,200,levels[selected_world][selected][1])
draw_text(8,64 + (16 * selected),"*")