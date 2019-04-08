///@argument monitor_width
///@argument monitor_height
///@argument rooms
{
if(room != 0){
	return;
}

var mw	= argument0;
var mh	= argument1;
var rm	= argument2;

var ma = mw / mh;

#region Calculations
if(global.cam_asr <= mw/mh){
	global.cam_cvr = mh	div global.cam_hg;
	
	global.cam_hg = mh / global.cam_cvr;
	global.cam_wd = global.cam_hg * ma;
			
}else {
	global.cam_cvr = mw div global.cam_wd;
	
	global.cam_wd = mw / global.cam_cvr;
	global.cam_hg = global.cam_wd / ma;
}

global.cam_asr = global.cam_wd / global.cam_hg;
#endregion

var len = array_length_1d(rm);

for(var i = 0; i < len; i++){
	var cam = room_get_camera(rm[i],0); //Get room's camera
		
	camera_set_view_size(cam, global.cam_wd, global.cam_hg);           //Change view size
	camera_set_view_border(cam, global.cam_wd / 2, global.cam_hg / 2); //Change view border
	
	room_set_viewport(rm[i], 0, true, 0, 0, global.cam_wd, global.cam_hg); //Set viewport
}
}