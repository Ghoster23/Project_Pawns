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

var _x1 = argument[1];
var _y1 = argument[2];
var _wd = argument[3];
var _hg = argument[4];

var _x2 = _x1 + _wd;
var _y2 = _y1 + _hg;

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

// Clicking
if(point_in_rectangle(obj_cursor.gui_x, obj_cursor.gui_y, _x2 - _hg, _y1, _x2, _y2)){	
	if(in_front and mouse_check_button_released(mb_left)){
		_vl = !_vl;
	}
}

// Draw Label
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(_x1, _y1 + _hg / 2 - 2, _label);

draw_set_valign(fa_top);
draw_set_color(c_white);

// Draw Box
switch _type {
	case 0: //Basic
		draw_set_color(_tparam);
		draw_rectangle(_x2 - _hg, _y1, _x2, _y2, true);
		draw_set_color(c_white);
	break;
	
	case 1: //Sprite
		draw_sprite_stretched(_tparam, -1, _x2 - _hg, _y1, _hg, _hg);
	break;
	
	case 2: //9SB
		scr_9SB_ext(_tparam, _x2 - _hg, _y1, _x2, _y2, _xs, _ys);
	break;
}

// Draw Tick
if(_vl) draw_sprite_stretched(tk_tick, -1, _x2 - _hg, _y1, _hg, _hg);

return _vl;
}