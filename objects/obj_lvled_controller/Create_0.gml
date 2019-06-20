if(scr_unique_inst()) {exit;}

state = "init";

next_state = "none";

var margin = 12;

#region Create Windows
main_wnd   = scr_window_create(obj_wnd_lvled_main, scr_wnd_st_tkg_init, margin, margin);

select_wnd = scr_window_create(obj_wnd_lvled_selector, scr_wnd_st_tkg_init, margin, main_wnd.y2 + 12);
#endregion