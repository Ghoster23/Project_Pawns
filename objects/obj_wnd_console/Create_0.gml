event_inherited();
scr_unique_inst();

title = "Console";

update_vars = true;

#region String Display
char_wd = scr_string_width_in_font( "A", fn_ide);
char_hg = scr_string_height_in_font("A", fn_ide);
#endregion

#region System
cmd_list  = []; // List of commands
cmd_help  = []; // Help for each command
cmd_count =  0; // Count of available commands

scr_console_commands(); // Load commands
#endregion

#region Input field
inp_line   =  "";

cursor   = "_"; // Text cursor
alarm[1] =  20; // Alarm for flashing the cursor

inp_memory = ds_list_create(); // Memory of executed commands
inp_select = 0;                // Selected memory entry
inp_memcnt = 0;                // Count of memorized entries
inp_change = false;            // Line changed in this step

inp_state = 0;

// Input Box Dimensions
inp_wd = sc_wd;
inp_hg = 36 * cm;

inp_x = x;
inp_y = y + sc_hg - inp_hg;
#endregion

#region Text Display
txt_memory = ds_list_create(); // All text to display
txt_count  = 0;                // Count of text entries
txt_start  = 0;                // Entry at which we start writing

txt_header_len = 5; // "[0]: "
txt_header_wd  = char_wd * txt_header_len;

txt_x = lf + 5 * char_wd; // X to start drawing each text line at
txt_y = tp;			      // Y to draw first line at

txt_wd = (rg - lf) - txt_header_wd;
txt_hg = (inp_y - margin) - tp;

txt_line_hg  = char_hg;
txt_line_cnt = 0;
txt_line_max = txt_hg div txt_line_hg;

txt_char_max = txt_wd div char_wd;
#endregion

#region Suggestions
sgg_state    =  0;
sgg_line     = "";
sgg_array    = [];
sgg_count    =  0;
sgg_selected =  0;

sgg_x = x1;
sgg_y = y2;

sgg_wd = sc_wd;
#endregion

debug_overlay = false;

height = bar_hg * cm + 4 * margin * cm + 48 * cm + 36 * cm;
width  = max(500, scr_string_width_in_font(title, font) + 60 * cm);

#region Resize
min_height = height;
min_width  = width;

resizeable = true;
#endregion

scr_window_list_selector_init(1);