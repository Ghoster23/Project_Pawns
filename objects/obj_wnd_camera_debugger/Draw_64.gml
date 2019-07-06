// Inherit the parent event
event_inherited();

if(closed){ exit; }

var hg = sc_hg;
var wd = sc_wd;

var iwd = rg - lf;
var ihg = bt - tp;

#region Variables
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch(tr_state) {
	case 0:
		draw_text_ext_transformed( x, y, "Instance not found.",
								line_hg * cm, iwd, cm, cm, 0);
	
		if(alarm[2] == -1){
			alarm[2] = 0.5 * room_speed;
		}
	break;
	
	case 1:
		scr_window_table_from_map(lf, tp, rg, tp + 8 * 16 * cm, tr_map);
	
		alarm[2] = -1;
	break;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
#endregion