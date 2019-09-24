///@argument text
///@argument x
///@argument y
///@argument width
///@argument text_box_ind
///@argument xscale_optional
///@argument yscale_optional
{
var txt = argument[0];

var x1 = argument[1];
var y1 = argument[2];

var max_char = argument[3];

var wd = max_char * string_width("W");
var hg = string_height("W");

var ti = argument[4];

var xs = 1;
if(argument_count > 5){ xs = argument[5]; }

var ys = 1;
if(argument_count > 6){ ys = argument[6]; }

switch input_state {
	case -1:
		if(scr_clicked_in(x1,y1,x1+wd,y1+hg)){
			input_state     = ti;
			keyboard_string = txt;
		}
		
		draw_set_color(c_white);
	break;
	
	default:
		if(input_state == ti){
			if(string_length(keyboard_string) < max_char){
				txt = keyboard_string;
			}
		
			if(scr_clicked_out(x1, y1, x1+wd, y1+hg)){
				input_state     = -1;
				keyboard_string = "";
			}
		
			draw_set_color(c_blue);
		}
	break;
}

draw_rectangle(x1, y1, x1+wd, y1+hg, true);

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
		
draw_text_transformed( x1, y1, txt, xs, ys, 0);

return txt;
}