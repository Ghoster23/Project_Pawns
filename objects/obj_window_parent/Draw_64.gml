if(not drawing or closed){ exit; }

#region Window Frame and Title
if(style == -1){
	draw_set_color(c_white);
	draw_rectangle(x1, y1, x2, y2, false);
	
	draw_set_color(c_black);
	draw_rectangle(x1, y1, x2, y2, true);
	
	draw_line(x1, y1 + bar_hg * cm, x2, y1 + bar_hg * cm);
}else {
	script_execute(style,st_params);
}

#region Title - should probably be part of the style
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_transformed(x1 + sc_margin, y1 + (bar_hg / 2) * cm, title, cm, cm, 0);

draw_set_valign(fa_top);
#endregion
#endregion

#region Close Button
if(closeable){
	var cl_x1  = x2 - 26 * cm;
	var cl_y1  = y1 + 10 * cm;
	var cl_x2  = cl_x1 + 16 * cm;
	var cl_y2  = cl_y1 + 16 * cm;

	if(scr_window_button(cl_x1, cl_y1, cl_x2, cl_y2, "x")){
		scr_window_close();
		closed = true;
	}
}
#endregion