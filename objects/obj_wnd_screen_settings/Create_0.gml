event_inherited();
scr_unique_inst();

title = "Screen Settings";

fullscreen   = obj_screen_controller.fullscreen;
pixelperfect = obj_screen_controller.pixelperfect;
dimensions   = obj_screen_controller.dimensions;
options      = obj_screen_controller.monitor_dimension_options;

height = bar_hg * cm + 4 * margin * cm + 48 * cm + 36 * cm;
width  = max(width, scr_string_width_in_font(title, font) + 60 * cm);

scr_window_list_selector_init(1);