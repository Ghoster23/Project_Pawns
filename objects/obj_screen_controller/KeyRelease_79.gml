///@description Toggle PixelPerfect
pixelperfect = !pixelperfect;

if(global.fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect, global.Monitor_wd, global.Monitor_hg, global.cam_wd, global.cam_hg, true);
}else {
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), global.cam_wd, global.cam_hg, true);
}