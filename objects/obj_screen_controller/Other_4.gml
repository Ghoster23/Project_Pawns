var cam = room_get_camera(room, 0); //Initial room camera

//Camera
global.cam_wd  = camera_get_view_width(cam);  //Default camera width
global.cam_hg  = camera_get_view_height(cam); //Default camera heigth

global.cam_asr = global.cam_wd/global.cam_hg; //Default camera aspect ratio

if(global.fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect,  global.Monitor_wd,   global.Monitor_hg, global.cam_wd, global.cam_hg, true);
}else {
	window_set_size(min(global.cam_wd, global.Monitor_wd), min(global.cam_hg, global.Monitor_hg));
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), global.cam_wd, global.cam_hg, true);
}