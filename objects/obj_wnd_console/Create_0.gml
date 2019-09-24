event_inherited();
scr_unique_inst();

title = "Console";

cmd_list  = [];
cmd_help  = [];
cmd_count =  0;

scr_console_commands(); // Load commands

cmd_line   = "";
cmd_cursor = "_";
alarm[1] = 20;

cmd_text   = ds_list_create(); // All text to display
cmd_memory = ds_list_create(); // Memory of executed commands
cmd_select = 0;                // Selected memory entry
cmd_memcnt = 0;                // Count of memorized entries
cmd_change = false;            // Line changed in this step

cmd_state = 0;

// Input Box Dimensions
ibx_x1 = x;
ibx_y1 = y + sc_hg - 36 * cm;

ibx_x2 = ibx_x1 + sc_wd;
ibx_y2 = ibx_y1 + 36 * cm;

debug_overlay = false;

height = bar_hg * cm + 4 * margin * cm + 48 * cm + 36 * cm;
width  = max(500, scr_string_width_in_font(title, font) + 60 * cm);

min_height = height;
min_width  = width;

resizeable = true;

char_wd = scr_string_width_in_font( "A", fn_ide);
char_hg = scr_string_height_in_font("A", fn_ide);

sgg_state    =  0;
sgg_line     = "";
sgg_array    = [];
sgg_count    =  0;
sgg_selected =  0;

scr_window_list_selector_init(1);