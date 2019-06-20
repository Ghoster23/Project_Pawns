///@argument x1
///@argument y1
///@argument x2
///@argument y2
///@argument label
///@argument type_optional
///@argument tparam_optional
///@argument hover_optional
///@argument hparam_optional
///@argument xscale_optional
///@argument yscale_optional
{
if(argument_count < 5){ return; }

var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[2];
var _y2 = argument[3];

var _label = argument[4];

var _type = bt_type;
if(argument_count > 5){
	_type = argument[5];
}

var _tparam = bt_tparam;
if(argument_count > 6){
	_tparam = argument[6];
}

var _hover = bt_hover;
if(argument_count > 7){
	_hover = argument[7];
}

var _hparam = bt_hparam;
if(argument_count > 8){
	_hparam = argument[8];
}

var _xs = 1;
if(argument_count > 9){
	_xs = argument[9];
}

var _ys = 1;
if(argument_count > 10){
	_ys = argument[10];
}

var _res = 0;
var _hov = false;

var _wd = _x2 - _x1;
var _hg = _y2 - _y1;

if(point_in_rectangle(obj_cursor.gui_x, obj_cursor.gui_y, _x1, _y1, _x2, _y2)){	
	if(in_front and mouse_check_button_pressed(mb_left) and alarm[0] == -1){
		_res = 1;
		alarm[0] = 5;
	}
	_hov = true;
}

#region _hover Begin
if(_hov){
	switch _hover {
		case 0: //Basic
			draw_set_alpha(_hparam);
		break;
		
		case 1: //Outline
			draw_set_color(_hparam);
			draw_rectangle(_x1, _y1, _x2, _y2, false);
			draw_set_color(c_white);
		break;
		
		case 2:
		break;
	}
}
#endregion

switch _type {
	case 0: //Basic
		if(_hover != 1 || not _hov){
			draw_set_color(_tparam);
			draw_rectangle(_x1, _y1, _x2, _y2, false);
			draw_set_color(c_white);
		}else {
			draw_set_color(_tparam);
			draw_rectangle(_x1, _y1, _x2, _y2, false);
			draw_set_color(_hparam);
			draw_rectangle(_x1, _y1, _x2, _y2, true);
			draw_set_color(c_white);
		}
	break;
	
	case 1: //Sprite
		draw_sprite_stretched(_tparam, -1, 
							  _x1 + _wd / 2 - sprite_xoffset + sprite_width  / 2, 
							  _y1 + _hg / 2 - sprite_yoffset + sprite_height / 2, 
							  _wd, 
							  _hg);
	break;
	
	case 2: //9SB
		scr_9SB_ext(_tparam, _x1, _y1, _x2, _y2, _xs, _ys);
	break;
}

#region _hover End
if(_hov){
	switch _hover {
		case 0: //Basic
			draw_set_alpha(1);
		break;
		
		case 1: //Outline
		break;
		
		case 2: //Draw over
			
		break;
	}
}
#endregion

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(_x1 + _wd / 2, _y1 + _hg / 2 - 2, _label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

return _res;
}