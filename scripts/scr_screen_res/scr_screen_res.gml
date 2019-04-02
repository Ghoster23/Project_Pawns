#region App Surface
application_surface_draw_enable(false);

if(global.fullscreen){
	var working_wd = global.Monitor_wd;
	var working_hg = global.Monitor_hg;
}else {	
	var working_wd = window_get_width();
	var working_hg = window_get_height();
}

var working_asr = working_wd/working_hg;

switch room {	
	default:
		if(global.cam_asr < working_asr){
			global.cam_cvr = working_hg div global.cam_hg;
			
			if(global.cam_cvr == 0){
				global.cam_cvr = working_hg / global.cam_hg;
			}
			
			surface_hg = global.cam_hg * global.cam_cvr;
			surface_wd = surface_hg    * global.cam_asr;
			
		}else {
			global.cam_cvr = working_wd div global.cam_wd;
			
			if(global.cam_cvr == 0){
				global.cam_cvr = working_wd / global.cam_wd;
			}
			
			surface_wd = global.cam_wd * global.cam_cvr;
			surface_hg = surface_wd    / global.cam_asr;
		}
	break;
}

surface_resize(application_surface, surface_wd, surface_hg);

global.Xoffset = (working_wd - surface_wd) / 2;
global.Yoffset = (working_hg - surface_hg) / 2;
#endregion

#region GUI
display_set_gui_size(surface_wd, surface_hg);

global.gui_WD = display_get_gui_width();
global.gui_HG = display_get_gui_height();

global.gui_ratio = global.gui_WD / 640;
#endregion