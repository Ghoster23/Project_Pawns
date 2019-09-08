///@description Initializes a window's appearence
{
style     = scr_wnd_st_ref; // Script that draws the window base
st_params = [];             // Parameters with which the style script is called

// Button
bt_type   = 0;				// [ 0 - Basic Rectangle | 1 - Sprite    | 2 - 9SB       ]
bt_tparam = c_white;		// [ 0 - colour          | 1 - sprite id | 2 - sprite id ]

// Hover over Button Effect
bt_hover  = 0;				// [ 0 - Transparency | 1 - Basic Outline | 2 -  ]
bt_hparam = 0.6;			// [ 0 - alpha        | 1 - colour        | 2 -  ]

// Tick Box
tk_type   = 0;				// [ 0 - Basic Outline | 1 - Sprite    | 2 - 9SB       ]
tk_tparam = c_white;		// [ 0 - colour        | 1 - sprite id | 2 - sprite id ]

font = -1;
}