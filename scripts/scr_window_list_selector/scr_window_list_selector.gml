///@argument val
///@argument x1
///@argument y1
///@argument list
///@argument select_id
///@argument xscale_optional
///@argument yscale_optional
{
var val = argument[0];

var x1 = argument[1];
var y1 = argument[2];

var arr = argument[3];

if(is_array(arr)){
	var len = array_length_1d(arr);
}else {
	return 0;
}

var wd = 0;
var hg = 0;

for(var i = 0; i < len; i++){
	var op = arr[i];
	var sop = string(op);
	
	wd = max(string_width(sop),wd);
	hg = max(string_height(sop),hg);
	
	arr[i] = sop;
}

wd += 12;

var si = argument[4];

var xs = 1;
if(argument_count > 5){ xs = argument[5]; }

var ys = 1;
if(argument_count > 6){ ys = argument[6]; }

val = clamp(val,0,len-1);

var opt = arr[val];

//Draw main rectangle
draw_set_color(c_white);
draw_rectangle(x1, y1, x1 + wd, y1 + hg, true);

//Draw selected option text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
		
draw_text_transformed( x1 + 6, y1, opt, xs, ys, 0);

//States
switch select_state[si] {
	case noone:
		if(scr_clicked_in(x1,y1,x1+wd,y1+hg)){
			select_state[si] = scr_window_create(obj_window_list_select_popup);
			
			if(select_state[si] != noone){
				with select_state[si] {
					title    = opt;
					width    = wd;
					height   = hg * (len + 1);
					bt_hg    = hg;
					x = x1 + width/2;;
					y = y1 + height/2;
					options  = arr;
					selected = val;
					op_count = len;
					alarm[0] = 5;
				}
			}
		}
	break;
	
	default:
		var popup = select_state[si];
		if(instance_exists(popup)){			
			if(popup.clicked){
				val = popup.selected;
				
				popup.closed = true;
				select_state[si] = noone;
			}
		}else {
			select_state[si] = noone;
		}
	break;
}

return val;
}