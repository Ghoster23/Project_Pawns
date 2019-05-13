///@description Toggle Fullscreen
global.fullscreen = !global.fullscreen;

window_set_fullscreen(global.fullscreen);

if(global.fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect,   global.Monitor_wd,     global.Monitor_hg, true);
}else {
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), true);
}