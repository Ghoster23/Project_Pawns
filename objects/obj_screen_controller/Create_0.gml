application_surface_draw_enable(false);
if(scr_unique_inst()) {exit;}

over = false;

alarm[0] = 5;

surface_wd = 0;
surface_hg = 0;

test_i = 0;
test_width  = [1080, 1280, 1280, 1366, 1440, 1600, 1920, display_get_width()];
test_heigth = [ 720,  800, 1024,  768,  900,  900, 1080, display_get_height()];

global.fullscreen = window_get_fullscreen();
pixelperfect = true;

global.gui_ratio = 1;

#region Init
//Monitor
global.Monitor_wd = test_width[7];   //Monitor width
global.Monitor_hg  = test_heigth[7]; //Monitor height

global.Monitor_asr = global.Monitor_wd / global.Monitor_hg; //Monitor aspect ratio

//Camera
global.cam_wd  = 896; //Default camera width
global.cam_hg   = 512; //Default camera heigth

global.cam_asr = global.cam_wd/global.cam_hg; //Default camera aspect ratio
global.cam_cvr = 1;                           //Default camera conversion ratio
#endregion

#region Adjustments
lvl_rooms = [room0];

scr_adjust_views_to_monitor(global.Monitor_wd, global.Monitor_hg, lvl_rooms);

if(global.fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect, global.Monitor_wd, global.Monitor_hg, true);
}else {
	window_set_size(global.cam_wd,global.cam_hg);
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), true);
}
#endregion