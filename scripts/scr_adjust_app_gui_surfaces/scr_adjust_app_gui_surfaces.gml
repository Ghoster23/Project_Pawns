///@argument pixelperfect
///@argument working_wd
///@argument working_hg
///@argument adjust_gui
{
#region App Surface
application_surface_draw_enable(false);

var pp = argument0;

var working_wd = argument1;
var working_hg = argument2;

var ag = argument3;

var working_asr = working_wd/working_hg;

switch room {
	default:
		if(global.cam_asr <= working_asr){
			if(pp){
				global.cam_cvr = working_hg div global.cam_hg;
			
				if(global.cam_cvr == 0){
					global.cam_cvr = working_hg / global.cam_hg;
				}
			}else {
				global.cam_cvr = working_hg / global.cam_hg;
			}
			
			surface_hg = global.cam_hg * global.cam_cvr;
			surface_wd = surface_hg	   * global.cam_asr;
			
		}else {
			if(pp){
				global.cam_cvr = working_wd div global.cam_wd;
			
				if(global.cam_cvr == 0){
					global.cam_cvr = working_wd / global.cam_wd;
				}
			}else {
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
if(ag){
	display_set_gui_maximize(global.cam_cvr, global.cam_cvr, global.Xoffset, global.Yoffset);

	global.gui_WD = display_get_gui_width();
	global.gui_HG = display_get_gui_height();

	global.gui_ratio = global.gui_WD / 640;
}
#endregion
}