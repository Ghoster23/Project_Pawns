///@argument monitor_width
///@argument monitor_height
///@argument rooms
{
if(room != 0){
	return;
}

var _mw	= argument0;
var _mh	= argument1;
var _rm	= argument2;

var _ma = _mw / _mh;

var _len = array_length_1d(_rm);

//For each room in the array
for(var i = 0; i < _len; i++){
	#region Init
	var _cam = room_get_camera(_rm[i], 0); //Get room's camera
	
	var _cam_wd  = camera_get_view_width(_cam);  //Get camera view width
	var _cam_hg  = camera_get_view_height(_cam); //Get camera view height
	var _cam_asr = _cam_wd / _cam_hg;            //Calculate the view aspect ratio
	
	var _cam_cvr = 1; //Camera view conversion ratio
	#endregion
	
	#region Calculations
	//If the camera's aspect ratio is lower or equal to the monitor's aspect ratio
	if(_cam_asr <= _mw / _mh){
		//Calculate the conversion ratio
		_cam_cvr = _mh	div _cam_hg;
		if(not _cam_cvr) { _cam_cvr = _mh / _cam_hg; }
	
		//Calculate new view dimensions
		_cam_hg = _cam_hg / _cam_cvr;
		_cam_wd = _cam_hg * _ma;
	
	//If the camera's aspect ratio is higher than the monitor's aspect ratio
	}else {
		//Calculate the conversion ratio
		_cam_cvr = _mw div _cam_wd;
		if(not _cam_cvr) { _cam_cvr = _mw / _cam_wd; }
		
		//Calculate new view dimensions
		_cam_wd = _cam_wd / _cam_cvr;
		_cam_hg = _cam_wd / _ma;
	}
	#endregion
	
	_cam_wd = floor(_cam_wd);
	_cam_hg = floor(_cam_hg);
		
	camera_set_view_size(  _cam,     _cam_wd,     _cam_hg); //Change view size
	camera_set_view_border(_cam, _cam_wd / 2, _cam_hg / 2); //Change view border
	
	room_set_viewport(_rm[i], 0, true, 0, 0, _cam_wd, _cam_hg); //Set viewport
}
}