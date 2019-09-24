///@argument val
///@argument x1
///@argument y1
///@argument list
///@argument select_id
///@argument width
///@argument xscale_optional
///@argument yscale_optional
{
var _val = argument[0];

var _x1 = argument[1];
var _y1 = argument[2];

var _arr = argument[3];

var _len = 0;

if(is_array(_arr)){
	_len = array_length_1d(_arr);
}else {
	return 0;
}

var _si = argument[4];

var _wd = 0;
if(argument_count > 5){ _wd = argument[5]; }

var _xs = 1;
if(argument_count > 6){ _xs = argument[6]; }

var _ys = 1;
if(argument_count > 7){ _ys = argument[7]; }

_val = clamp(_val, 0, _len - 1);

var _opt = _arr[_val];

//States
switch select_popup[_si] {
	case noone:
		select_popup[_si] = scr_window_popup_create(obj_window_list_select_popup, _x1, _y1);
		
		if(select_popup[_si] != noone){
			with select_popup[_si] {
				title    = _opt;
				
				options  = _arr;
				selected = _val;
				op_count = _len;
				
				width = _wd;
				
				alarm[0] = 5;
			}
		}
	break;
	
	default:
		var _popup = select_popup[_si];
		
		if(instance_exists(_popup)) {
			with _popup {		
				title = _opt;
				width = _wd;
				
				in_front = other.in_front;
				
				if(options != _arr) {
					options  = _arr;
					op_count = _len;
					
					booted = false;
					
					selected = 0;
				}
			
				_val = selected;
			}
			
		}else {
			select_popup[_si] = noone;
		}
	break;
}

return _val;
}