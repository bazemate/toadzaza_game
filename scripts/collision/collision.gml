function collision(){

}

function scr_init_collision() 
{
	hsp = 0;
	vsp = 0;
	grav = 0.2;
	max_grav = 10;
	grounded = false;
}

function scr_collision()
{
	// X
	var sub_pixel = 0.5;
	
	if place_meeting(x + hsp, y, obj_solid)
	{
		var pixel_check = sub_pixel * sign(hsp);
		while !place_meeting(x + pixel_check, y, obj_solid)
			x += pixel_check;
		
		hsp = 0;	
	}
	x += hsp;
	
	// Y
	vsp = min(vsp + grav, max_grav);
	
	if place_meeting(x, y + vsp, obj_solid)
	{
		var pixel_check_vsp = sub_pixel * sign(vsp);
		while !place_meeting(x, y + pixel_check_vsp, obj_solid)
			y += pixel_check_vsp;
		
		vsp = 0;	
	}
	
	y += vsp;
	
	grounded = (place_meeting(x, y + 1, obj_solid) ? true : false)
}