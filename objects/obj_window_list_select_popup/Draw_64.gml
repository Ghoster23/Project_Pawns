// Inherit the parent event
event_inherited();

var lf = x - width/2;
var tp = y - height/2 + 36;

for(var i = 0; i < op_count; i++){
	var op = options[i];
	
	if(scr_window_button(lf,tp+bt_hg*i,lf+width,tp+bt_hg*(i+1),options[i])){
		clicked  = true;
		selected = i;
	}
}