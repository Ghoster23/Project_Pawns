if(scr_unique_inst()) {exit;}

image_xscale = 3;
image_yscale = 3;

//Get camera
camera = room_get_camera(room,0);
cam_wd = camera_get_view_width(camera);
cam_hg = camera_get_view_height(camera);

//Movement
m_spd = 0.25;

target = instance_nearest(0,0,obj_player);

if(target != noone and instance_exists(target)){
	x = target.x + 32;
	y = target.y + 32;
}else {
	x = room_width  / 2;
	y = room_height / 2;
	target = noone;
}

//Position
cam_x_c = x;
cam_y_c = y;
cam_x_s = x;
cam_y_s = y;
cam_x_t = x;
cam_y_t = y;

//Zoom
cam_wd_o = cam_wd;
cam_hg_o = cam_hg;

zoom = 1;
rate = 0.3;
tolr = 1;

t_zoom = 1;

cam_wd_z = cam_wd div zoom;
cam_hg_z = cam_hg div zoom;

//Shake
global.shake = 0;

//States
m_state = 0;
z_state = 0;