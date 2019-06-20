///@argument object_index
///@argument style_opt
///@argument x_opt
///@argument y_opt
{
var obji = argument[0];

if(not is_descended(obji, obj_window_popup_parent)) {
	show_debug_message("Failed to create a window popup due to invalid object id.");
	return noone;
}

if(not is_descended(object_index, obj_window_parent)) {
	show_debug_message("Failed to create a window popup due to invalid creator object id.");
	return noone;
}

var style = style_init;

var xx = x + bar_hg * cm;
var yy = y + bar_hg * cm;

switch argument_count {
	default:
		show_debug_message("Failed to create a window due to invalid number of arguments.");
		return noone;
	break;
	
	case 1:
	break;
	
	case 2:
		style = argument[1];
	break;
	
	case 3:
		xx = argument[1];
		yy = argument[2];
	break;
	
	case 4:
		style = argument[1];
		
		xx = argument[2];
		yy = argument[3];
	break;
}

var wnd  = instance_create_layer( xx, yy, "Windows", obji);

with wnd {
	scr_window_register_w_parent(other.id);
		
	if(style != -1) {
		script_execute(style);
	}
}

return wnd;
}