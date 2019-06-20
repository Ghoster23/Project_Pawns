///@param _x1
///@param _y1
///@param _x2
///@param _y2
///@param value
///@param min
///@param max
///@param xscale_optional
///@param yscale_optional
{
var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[2];
var _y2 = argument[3];

var _val = int64(argument[4]);

var _min = argument[5];
var _max = argument[6];

var _xs = 1;
if(argument_count > 7){ _xs = argument[7]; }

var _ys = 1;
if(argument_count > 8){ _ys = argument[8]; }

var _wd = _x2 - _x1;
var _hg = _y2 - _y1;

if(_wd > _hg){
	var type = 0;
}else {
	var type = 1;
}

switch type {
	case 0:
		if(scr_window_button(_x1, _y1, _x1 + _wd / 3, _y2, "-")){
			_val -= 1;
		}
		
		if(scr_window_button(_x2 - _wd / 3, _y1, _x2, _y2, "+")){
			_val += 1;
		}
	break;
	
	case 1:
		if(scr_window_button(_x1, _y2 - _hg / 3, _x2, _y2, "-")){
			_val -= 1;
		}
		
		if(scr_window_button(_x1, _y1, _x2, _y1 + _hg / 3, "+")){
			_val += 1;
		}
	break;
}

if(_val < _min){
	_val = _max;
}

if(_val > _max){
	_val = _min;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_ext_transformed((_x1 + _wd / 2) * _xs, (_y1 + _hg / 2 - 10) * _ys, string(_val),
						  0, _wd / 3 * _xs, _xs, _ys, 0);
						  
draw_set_halign(fa_left);
draw_set_valign(fa_top);

return _val;
}