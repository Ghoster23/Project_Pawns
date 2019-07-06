event_inherited();

height = 100;

moveable  = true;
closeable = true;

tr_inst = noone;
tr_vars = ds_list_create();
tr_cnt  = 0;
tr_vals = ds_list_create();

title = "Instance Variables Tracker - " + string(id);
width = max(width, scr_string_width_in_font(title, font) + 60);