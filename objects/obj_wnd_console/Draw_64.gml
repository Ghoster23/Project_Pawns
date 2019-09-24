// Inherit the parent event
event_inherited();

if(closed){ exit; }

var iwd = rg - lf; // Internal window Width

char_wd = string_width("A");  // Pixel Width  of a character
char_hg = string_height("A"); // Pixel Height of a character

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

#region Text
var _entry = cmd_text[| 0];
var _index = 0;

var _line_hg  = 1.2 * char_hg;
var _line_y   = y1 + 36 * cm + margin * cm + _line_hg * 0.5;
var _line_cnt = 0;
var _line_max = (ibx_y1 - margin * cm - _line_y) div _line_hg;

var _char_per_line = iwd div char_wd;

while(_entry != undefined and _line_cnt < _line_max) {
	var _text_len = string_length(_entry);
	
	var _written = 0;
	
	// Draw text
	while(_written < _text_len and _line_cnt < _line_max) {
		var _line_len = min(_text_len - _written, _char_per_line);
		
		// Draw line
		draw_text(lf, _line_y + _line_hg * _line_cnt, string_copy(_entry, _written, _line_len));
		
		draw_line(lf, _line_y + _line_hg * _line_cnt, rg, _line_y + _line_hg * _line_cnt);
		
		_written  += _line_len;
		_line_cnt += 1;
	}
	
	_index++;
	_entry = cmd_text[| _index];
}
#endregion

#region Input Box
// Draw Text box
scr_9SB_ext( spr_HUD_9SB, ibx_x1, ibx_y1, ibx_x2, ibx_y2, 1, 1);

var _len = string_length(cmd_line);     // Number of characters written

var max_chars = iwd div (char_wd * cm); // Maximum number of characters that can be displayed

// String to display
var _cmd = string_copy(cmd_line, max(0, _len - max_chars), min(_len, max_chars));

#region Draw text
var _txt_x1 = lf;
var _txt_y1 = ibx_y1 + (ibx_y2 - ibx_y1) * 0.5 * cm;

draw_text( _txt_x1, _txt_y1, _cmd + (cmd_state == 1 ? cmd_cursor : ""));
#endregion
#endregion

#region Suggestion Box
if(sgg_state == 1) {
	var _sgg_y1  = ibx_y2 + 18 * cm;

	var _sgg_height = max(36 * cm, (sgg_count + 1) * _line_hg * cm + (36 - _line_hg) * cm);

	// Draw Text box
	scr_9SB_ext( spr_HUD_9SB, ibx_x1, ibx_y2, ibx_x2, ibx_y2 + _sgg_height, 1, 1);

	#region Draw Suggestions
	for(var i = -1; i < sgg_count; i++) {
		var j = i + 1;
	
		var _txt_y1 = _sgg_y1 + _line_hg * j; // Text Y
	
		#region Highlight Selection
		if(i == sgg_selected) {
			draw_set_alpha(0.5);
			draw_rectangle(_txt_x1, _txt_y1 - char_hg * 0.5, _txt_x1 + iwd, _txt_y1 + char_hg * 0.5, false);
			draw_set_alpha(1);
		}
		#endregion
		
		#region Draw Suggestion
		if(i == -1) {
			_len = string_length(sgg_line);
			_cmd = string_copy(sgg_line, max(0, _len - max_chars), min(_len, max_chars));
			draw_text(_txt_x1, _txt_y1, _cmd);
		}else {
			draw_text(_txt_x1, _txt_y1, sgg_array[i]);
		}
		#endregion
	}
	#endregion
}
#endregion

draw_set_valign(fa_top);