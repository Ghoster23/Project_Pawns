// Inherit the parent event
event_inherited();

if(closed){ exit; }

var iwd = rg - lf;

var ele_y  = tp;
var ele_hg = 24 * cm;

fullscreen = scr_window_tickbox( fullscreen, lf, ele_y, iwd, ele_hg, "Fullscreen");

ele_y += ele_hg + margin * cm;

pixelperfect = scr_window_tickbox( pixelperfect, lf, ele_y, iwd, ele_hg, "Pixel Perfect");

ele_y += ele_hg + margin * cm;

dimensions = scr_window_list_selector( dimensions, lf, ele_y, options, 0, iwd);

with obj_screen_controller {
	if(fullscreen != other.fullscreen) {
		fullscreen   = other.fullscreen;
		window_set_fullscreen(fullscreen);
	}
	
	pixelperfect = other.pixelperfect;
	dimensions   = other.dimensions;
}