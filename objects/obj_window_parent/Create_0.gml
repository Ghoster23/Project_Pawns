outline_init();

visible = false;

#region Measurements
width  = 200;
height = 200;

bar_hg  = 36; // Window header height

line_hg = 16; // Line height for windows that have them (ex. tracking variables)

margin  = 12; // Distance between window border and its elements

sc_margin = margin;

sc_wd = width;
sc_hg = height;

// Window body limits
rg = 0;
tp = 0;
lf = 0;
bt = 0;
#endregion

#region Positioning
x1 = x;
y1 = y;

x2 = x1 + width;
y2 = y1 + height;
#endregion

#region Properties
drawer = noone; // Controller which draws the windows

title = "Template";

#region Movement
moveable = true; // Can this window be moved by the user

mov_state = 0; // Window's movement state

// Distances from window origin to mouse when movement started
dist_x = 0;
dist_y = 0;
#endregion

#region Resize
resizeable = false; // Can be resized

resize_state = 0;

min_width  = width;
min_height = height;
#endregion

closeable  = true;  // Can the window be closed
closed     = false; // has the window been closed

#region Style
style_init = -1; // Script that initializes style variables
style      = -1; // Script which draws the window frame
st_params  = []; // Parameters for style script

bt_type   = 0;      // Button style
bt_tparam = c_blue; // Button style parameter

bt_hover  = 0;      // Hover over button style
bt_hparam = 0.5;    // Hover parameter

font = -1;

cm = 1; // Scaling factor
#endregion

drawing = false; // Is the window being drawn

in_front = false; // Is the window in-front or obstructed by another

#region Hierarchy
parent = noone;

// Subservient windows
sub_windows      = ds_list_create();
sub_window_count = 0;
#endregion
#endregion