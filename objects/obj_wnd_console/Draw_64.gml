// Inherit the parent event
event_inherited();

if(closed){ exit; }

var iwd = rg - lf; // Internal window Width

#region Var update
if(update_vars) {
	char_wd = string_width("A");  // Pixel Width  of a character
	char_hg = string_height("|"); // Pixel Height of a character

	#region Input field
	// Input Box Dimensions
	inp_wd = sc_wd;
	inp_hg = 36 * cm;

	inp_x = x1;
	inp_y = y1 + sc_hg - inp_hg;
	#endregion

	#region Text Display
	txt_header_wd  = char_wd * txt_header_len;

	txt_x = lf + txt_header_len * char_wd; // X to start drawing each text line at
	txt_y = tp;			                   // Y to draw first line at

	txt_wd = (rg - lf) - txt_header_wd;
	txt_hg = (inp_y - margin) - tp;

	txt_line_hg  = char_hg;
	txt_line_max = txt_hg div txt_line_hg;

	txt_char_max = txt_wd div char_wd;
	#endregion

	#region Suggestions
	sgg_x = x1;
	sgg_y = y2;

	sgg_wd = sc_wd;
	#endregion
}
#endregion

#region Scroll
if(in_front and point_in_rectangle(obj_cursor.gui_x, obj_cursor.gui_y, x1, y1 + 48 * cm, x2, y2 - 48 * cm)) {
	if(mouse_wheel_up()) {
		txt_start = txt_start - 1 > -1 ? txt_start - 1 : txt_count - 1;
	}
	
	if(mouse_wheel_down()) {
		txt_start = txt_start + 1 < txt_count ? txt_start + 1 : 0;
	}
}
#endregion

draw_set_halign(fa_left);
draw_set_valign(fa_top);

#region Text
var _entry     = "";
var _entry_len =  0;

var _written = 0;

var _line_cnt = 0;

// For each entry
for(var i = txt_start; txt_start < txt_count; i++) {
	if(txt_line_cnt < txt_line_max) {
		break;
	}
	
	_entry = txt_memory[| i];
	
	// Draw header
	draw_text(lf, txt_y + txt_line_hg * txt_line_cnt, "[" + string(i) + "]: ");
	
	// Draw text
	while(_written < _entry_len and _line_cnt < txt_line_max) {
		var _line_len = min(_entry_len - _written, txt_char_max);
		
		var _line = string_copy(_entry, _written, _line_len);
		
		#region Account for \n
		var _n_ln = string_pos("\n", _line);
		
		if(_n_ln != 0) {
			_line_len = _written + _n_ln + 1;
			_line     = string_copy(_entry, _written, _line_len - 1);
		}
		#endregion
		
		// Draw line
		draw_text(txt_x, txt_y + txt_line_hg * _line_cnt, _line);
		
		_written  += _line_len;
		_line_cnt += 1;
	}
}
#endregion

draw_set_valign(fa_middle);

#region Input Box
// Draw Text box
scr_9SB_ext( spr_HUD_9SB, inp_x, inp_y, inp_x + inp_wd, inp_y + inp_hg, 1, 1);

var _len = string_length(inp_line);     // Number of characters written

var max_chars = iwd div (char_wd * cm); // Maximum number of characters that can be displayed

// String to display
var _cmd = string_copy(inp_line, max(0, _len - max_chars), min(_len, max_chars));

// Draw input
draw_text( lf, inp_y + inp_hg * 0.5 * cm, _cmd + (inp_state == 1 ? cursor : ""));
#endregion

#region Suggestion Box
if(sgg_state == 1) {
	var _sgg_hg = max(36 * cm, (sgg_count + 1) * txt_line_hg * cm + (36 - txt_line_hg) * cm);

	// Draw Text box
	scr_9SB_ext( spr_HUD_9SB, sgg_x, sgg_y, sgg_x + sgg_wd, sgg_y + _sgg_hg, 1, 1);

	#region Draw Suggestions
	for(var i = -1; i < sgg_count; i++) {
		var j = i + 1;
	
		var _txt_y = sgg_y + txt_line_hg * j; // Text Y
	
		#region Highlight Selection
		if(i == sgg_selected) {
			draw_set_alpha(0.5);
			draw_rectangle(sgg_x, _txt_y - char_hg * 0.5, sgg_x + iwd, _txt_y + char_hg * 0.5, false);
			draw_set_alpha(1);
		}
		#endregion
		
		#region Draw Suggestion
		if(i == -1) {
			_len = string_length(sgg_line);
			_cmd = string_copy(sgg_line, max(0, _len - max_chars), min(_len, max_chars));
			draw_text(sgg_x, _txt_y, _cmd);
		}else {
			draw_text(sgg_x, _txt_y, sgg_array[i]);
		}
		#endregion
	}
	#endregion
}
#endregion

draw_set_valign(fa_top);