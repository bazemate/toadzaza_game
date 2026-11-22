function essential_scripts(){

}

function approach(a,b,spd)
{
	if (a < b)
		return min(a + spd,b);
	else
		return max(a - spd,b);
}

function wave(from, to, duration, offset) {
	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * a4;	
}

function wave_alt(from, to, duration, offset, _current_time) {
	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((_current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * a4;	
}

//https://www.davetech.co.uk/gamemakereasingandtweeningfunctions i suck at easing okay i just had to somehow get it anyway
function ease_out_elastic(input_value,output_min,output_max,input_max) 
{
	var _s = 1.70158;
	var _p = 0;
	var _a = output_max;

	if (input_value == 0 || _a == 0)
	{
	    return output_min;
	}

	input_value /= input_max;

	if (input_value == 1)
	{
	    return output_min + output_max;
	}

	if (_p == 0)
	{
	    _p = input_max * 0.3;
	}

	if (_a < abs(output_max)) 
	{ 
	    _a = output_max;
	    _s = _p * 0.25; 
	}
	else 
	{
	    _s = _p / (2 * pi) * arcsin (output_max / _a);
	}

	return _a * power(2, -10 * input_value) * sin((input_value * input_max - _s) * (2 * pi) / _p ) + output_max + output_min;
}
//credit to glasses for the alignment
function draw_text_wave(_x,_y,_text,_wave_height,_wave_time,_offset_amount, _halign = fa_left)
{
	var offset = 0;
	var string_processed = "";
    var _align_x = 0;
	for(var i = 1; i <= string_length(_text); i++) 
	{
        switch _halign
        {
            case fa_center:
                _align_x = string_width(_text)/2
                break
            case fa_right:
                _align_x = string_width(_text)
                break
        }
	    offset += (_wave_time * _offset_amount);
	    var letters = string_char_at(_text,i);
	    var size_processed = string_width(string_processed);
	    var height = wave_alt(-_wave_height, _wave_height, 1, 0, current_time + offset);
	    draw_text(_x + size_processed - _align_x,_y - height,letters);
	    string_processed += letters;
	}
}