switch state
{
	case 0:
		y = ystart
		break;
	case 1:
		if y != (ystart - 16)
			y = approach(y,ystart - 16,0.5)
		break;
	case 2:
		scr_collision()
		grav = 0.2
		hsp = 1 * image_xscale

		if place_meeting(x + hsp,y,obj_solid)
			image_xscale = -image_xscale;
		
		var block = noone
		if place_meeting(x,y + 1,obj_block)
		{
			block = instance_place(x,y + 2,obj_block)
			with block
				shroom_id = other.id
		} 
		else 
		{
			with block
				shroom_id = noone
		}
		
		break;
}

if state != 0
{
	if state == 1
	{
		if y == (ystart - 16)
			meet_player();
	}
	else
		meet_player();
}	