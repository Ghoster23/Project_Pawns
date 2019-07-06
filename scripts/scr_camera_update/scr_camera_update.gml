{
if(instance_exists(obj_camera)) {
	var _x = obj_camera.x;
	var _y = obj_camera.y;
	
	var _wd = obj_camera.width;
	var _hg = obj_camera.height;
	
	//Update the room's camera
	camera_set_view_pos(   view_current, _x - _wd / 2, _y - _hg / 2);
	camera_set_view_size(  view_current,          _wd,          _hg);
	camera_set_view_border(view_current,      _wd / 2,      _hg / 2);
}
}