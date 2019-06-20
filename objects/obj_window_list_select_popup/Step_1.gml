if(not booted) {	
	var _wd = 0;
	var _hg = 0;

	for(var i = 0; i < op_count; i++){
		var _option  = options[i];
		var _selected_option = string(_option);
	
		_wd = max( string_width(_selected_option), _wd);
		_hg = max(string_height(_selected_option), _hg);
	}
	
	bar_hg = max(36, _hg);
	
	btn_hg = _hg;

	width       = max(_wd + margin + 36, width);
	full_height = _hg * op_count + bar_hg + 2 * margin;
	height      = full_height;
	
	booted = true;
}

title = options[selected];

if(collapsed) {
	height = bar_hg + 2;
}else {
	height = full_height;
}

event_inherited();