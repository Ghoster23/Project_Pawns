event_inherited();

var cl_x1  = x2    - 26 * cm;
var cl_y1  = y1    + 10 * cm;
var cl_x2  = cl_x1 + 16 * cm;
var cl_y2  = cl_y1 + 16 * cm;

var btn_sc_hg = btn_hg * cm;
var space = (bt - tp - btn_sc_hg * op_count) / (op_count - 1);

if(not collapsed) {
	if(scr_clicked_out(x1, y1, x2, y2)) {
		collapsed = true;
		exit;
	}
	
	var btn_y = tp;
	
	for(var i = 0; i < op_count; i++){
		if(scr_window_button(lf, btn_y, rg, btn_y + btn_sc_hg, options[i])){
			if(i != selected){
				collapsed = true;
				selected = i;
			}
		}
		
		btn_y += btn_sc_hg + space;
	}
}

if(scr_window_button(cl_x1, cl_y1, cl_x2, cl_y2, collapsed ? "v" : "^")){
	collapsed = not collapsed;
	
	if(not collapsed) {
		scr_window_unregister_w_parent();
		scr_window_register_w_parent(parent);
	}
}