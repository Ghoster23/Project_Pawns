event_inherited();

height = bar_hg * cm + 4 * margin * cm + 48 * cm + 8 * 16 * cm;

moveable  = true;
closeable = true;

tr_state = 0;

tr_inst = obj_camera.id;
tr_map  = ds_map_create();

ds_map_add(tr_map,           "x", 0);
ds_map_add(tr_map,    "target_x", 0);
ds_map_add(tr_map,           "y", 0);
ds_map_add(tr_map,    "target_y", 0);
ds_map_add(tr_map,       "width", 0);
ds_map_add(tr_map,      "height", 0);
ds_map_add(tr_map,        "zoom", 0);
ds_map_add(tr_map, "target_zoom", 0);

title = "Camera Debugger";

width = max(width, scr_string_width_in_font(title, font) + 60);