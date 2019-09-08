application_surface_draw_enable(false);
if(scr_unique_inst()) {exit;}

over = false;

alarm[0] = 5;

monitor_dimension_options = ["1080x720", "1280x800", "1280x1024", "1366x768", "1440x900", "1600x900", "1920x1080", "Auto-detect"];
monitor_width  = [1080, 1280, 1280, 1366, 1440, 1600, 1920, display_get_width()];
monitor_heigth = [ 720,  800, 1024,  768,  900,  900, 1080, display_get_height()];

dimensions = 7;

fullscreen   = window_get_fullscreen();
pixelperfect = true;

global.gui_ratio = 1;

#region Init
//Monitor
global.Monitor_wd = monitor_width[dimensions];  //Monitor width
global.Monitor_hg = monitor_heigth[dimensions]; //Monitor height

//lvl_rooms = [rm_start, room0];

// Adjusts room views' dimenions to be a (sub)multiple of the monitor's dimensions
//scr_adjust_views_to_monitor(global.Monitor_wd, global.Monitor_hg, lvl_rooms);

//Camera
global.cam_cvr = 1; //Default camera conversion ratio
#endregion

#region Adjustments
if(global.fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect, global.Monitor_wd, global.Monitor_hg, view_wport[0], view_hport[0], true);
}else {
	window_set_size(view_wport[0], view_hport[0]);
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), view_wport[0], view_hport[0], true);
}
#endregion