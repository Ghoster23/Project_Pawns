// Inherit the parent event
event_inherited();

var ihg = bt - tp;

var yy = tp;

var elm_hg  = 24 * cm;
var elm_sep = (ihg - 24 * cm * 5) div 4;

#region Save
if(scr_window_button(lf, yy, rg, yy + elm_hg, "Save")) {
	with(obj_lvl_editor_controller) {
		next_state = "save";
	}
}
#endregion

yy += elm_hg + elm_sep;

#region Load
if(scr_window_button(lf, yy, rg, yy + elm_hg, "Load")) {
	with(obj_lvl_editor_controller) {
		next_state = "load";
	}
}
#endregion

yy += elm_hg + elm_sep;

#region Test
if(scr_window_button(lf, yy, rg, yy + elm_hg, "Test")) {
	with(obj_lvl_editor_controller) {
		next_state = "test";
	}
}
#endregion

yy += elm_hg + elm_sep;

#region Size
lvl_wd = scr_window_up_down_selector(lf, yy, rg, yy + elm_hg, lvl_wd, 8, 64);

yy += elm_hg + elm_sep;

lvl_hg = scr_window_up_down_selector(lf, yy, rg, yy + elm_hg, lvl_hg, 8, 64);
#endregion