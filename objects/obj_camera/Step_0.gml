if instance_exists(follow)
{
	if (follow.movespeed >= 2 && follow.state != states.finish)
		offsetspeed = approach(offsetspeed,(follow.movespeed * follow.image_xscale) * 20,2);
	else
		offsetspeed = approach(offsetspeed,0,2);
		
	_x += offsetspeed;
	_x = (other.follow.x) - (_width / 2);
		
	last_x = _x;
	
}
else {
	_x = last_x - (_width / 2); 
}

_x = clamp(_x + offsetspeed + xoffset,0,room_width - _width);
camera_set_view_pos(view_camera[0],_x,_y);

var backgrounds = ds_map_find_first(background_map);
repeat(ds_map_size(background_map))
{
	layer_x(backgrounds, background_map[? backgrounds] * _x);
	backgrounds = ds_map_find_next(background_map, backgrounds);
}