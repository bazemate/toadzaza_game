function essential_scripts(){

}

function approach(a,b,spd)
{
	if (a < b)
		return min(a + spd,b);
	else
		return max(a - spd,b);
}