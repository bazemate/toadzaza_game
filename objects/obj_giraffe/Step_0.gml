scr_collision()
if grounded
{
	vsp -= 4;
	giraffe._frame = 0;
}
hsp = -2 * image_xscale

//i hate easing 
giraffe._frame += 0.1;
giraffe.scale._x = ease_out_elastic(giraffe._frame,1.5,1 - 1.5,10);
giraffe.scale._y = ease_out_elastic(giraffe._frame,0.75,1 - 0.75,10);

if place_meeting(x + hsp,y,obj_solid)
	image_xscale = -image_xscale;