draw_set_font(global.font)
draw_set_halign(fa_left)
draw_text(24,16,"TOADZAZA")
var score_str = string(round(global.highscore));
var score_cur_index = 0;
for(var i = 0; i < 6; i++)
{
	if(string_length(score_str) > 5 - i)
		score_cur_index = real(string_char_at(score_str, i - 5 + string_length(score_str)));
	else
		score_cur_index = 0;

	draw_text(24 + (8 * i), 24, score_cur_index);
}
draw_sprite_ext(spr_coin,image_index,89,20,0.4,0.5,0,c_white,1)
if global.coins >= 10
	draw_text(104,24,string_concat("X",global.coins));
else
	draw_text(104,24,string_concat("X","0",global.coins));

draw_text(144,16,"WORLD")
draw_text(144,24,"1-1")
draw_text(201,16,"TIME")
