follow = obj_player;
cam = {
	_x : camera_get_view_x(view_camera[0]),
	_y : 0,
	_width : camera_get_view_width(view_camera[0]),
	_height : camera_get_view_height(view_camera[0]),
	xoffset : 0,
	last_x : camera_get_view_x(view_camera[0]),
	offsetspeed : 0
};
background_map = ds_map_create();
background_map[? layer_get_id("Background")] = 0.95;
background_map[? layer_get_id("Backgrounds_1")] = 0.7;
background_map[? layer_get_id("Backgrounds_2")] = 0.4;