if instance_exists(follow)
{
	if (follow.movespeed != 0)
		cam.offsetspeed = approach(cam.offsetspeed,(follow.movespeed * follow.image_xscale) * 20,2);
	else
		cam.offsetspeed = approach(cam.offsetspeed,0,2);
	with cam
	{
		_x += offsetspeed;
		_x = (other.follow.x) - (_width / 2);
	}
	last_x = cam._x;
	
}
else {
	cam._x = cam.last_x - (cam._width / 2); 
}
with cam 
{
	_x = clamp(_x + offsetspeed + xoffset,0,room_width - _width);
	camera_set_view_pos(view_camera[0],_x,_y);
}
var backgrounds = ds_map_find_first(background_map);
repeat(ds_map_size(background_map))
{
	layer_x(backgrounds, background_map[? backgrounds] * cam._x);
	backgrounds = ds_map_find_next(background_map, backgrounds);
}