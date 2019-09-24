if(display_w != global.gui_WD or display_h != global.gui_HG) {
	display_w = global.gui_WD;
	display_h = global.gui_HG;

	//================ commandline bar =====================================
	cmdline_left   = display_w - console_w;
	cmdline_top    = display_h - console_h;
	cmdline_right  = display_w;
	cmdline_bottom = display_h;

	//================ log button =================
	logbtn_right  = cmdline_left;
	logbtn_bottom = cmdline_bottom;
	logbtn_left   = logbtn_right - logbtn_w;
	logbtn_top    = cmdline_top;

	tri1x = logbtn_left   + tri_padding;
	tri1y = logbtn_bottom - tri_padding;
	tri2x = logbtn_right  - tri_padding;
	tri2y = logbtn_bottom - tri_padding;
	tri3x = logbtn_left   + logbtn_w/2;
	tri3y = logbtn_top    + tri_padding;

	//================ scroll bar =================
	scrollbar_bottom = logbtn_top - 20;
	scrollbar_top    = cmdline_top - log_h + 20;
	scrollbar_len    = scrollbar_bottom - scrollbar_top;

	scrollbar_offset = (scrollbar_len * scroll_offset)/scroll_max_offset;
	
	mid_pointx       = logbtn_left + logbtn_w/2;
	mid_pointy       = scrollbar_bottom - scrollbar_offset;
}