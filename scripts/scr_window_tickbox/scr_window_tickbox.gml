///@argument val
///@argument x
///@argument y
///@argument width
///@argument height
///@argument label
///@argument xscale_optional
///@argument yscale_optional
{
if(argument_count < 6){ return; }

var _vl = argument[0];

var _x  = argument[1];
var _y  = argument[2];
var _wd = argument[3];
var _hg = argument[4];

var _x2 = _x1 + _sz;
var _y2 = _y1 + _sz;

var _label = argument[5];

var _type = tk_type;
if(argument_count > 6){
	_type = argument[6];
}

var _tparam = tk_tparam;
if(argument_count > 7){
	_tparam = argument[7];
}

var _xs = 1;
if(argument_count > 8){
	_xs = argument[8];
}

var _ys = 1;
if(argument_count > 9){
	_ys = argument[9];
}

var _res = 0;

if(point_in_rectangle(obj_cursor.gui_x, obj_cursor.gui_y, _x, _y, _x2, _y2)){	
	if(in_front and mouse_check_button_released(mb_left)){
		_res = 1;
	}
}

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(_x1, _y1 + _sz / 2 - 2, _label);

draw_set_valign(fa_top);
draw_set_color(c_white);

var _label_wd = string_width(_label);

switch _type {
	case 0: //Basic
		draw_set_color(_tparam);
		draw_rectangle(_x1, _y1, _x2, _y2, true);
		draw_set_color(c_white);
	break;
	
	case 1: //Sprite
		draw_sprite_stretched(_tparam, -1, 
							  _x1 + _wd / 2 - sprite_xoffset + sprite_width  / 2, 
							  _y1 + _hg / 2 - sprite_yoffset + sprite_height / 2, 
							  _wd, _hg);
	break;
	
	case 2: //9SB
		scr_9SB_ext(_tparam, _x1, _y1, _x2, _y2, _xs, _ys);
	break;
}

return _res;
}