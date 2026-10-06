function essential_scripts(){

}

function approach(a,b,spd)
{
	if (a < b)
		return min(a + spd,b);
	else
		return max(a - spd,b);
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