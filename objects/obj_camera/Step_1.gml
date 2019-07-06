#region Target
switch room {
	default:
		if(target != noone){
			target_x = target.x + 32;
			target_y = target.y + 32;
		}else {
			target_x = room_width  div 2;
			target_y = room_height div 2;
		}
		
		can_zoom = false;
	break;
	
	case rm_level_editor:
		if(mouse_check_button(mb_middle)) {
			var _dist = distance_to_point(obj_cursor.rm_x, obj_cursor.rm_y);
		
			if(_dist > 0.15 * height) {
				target_x = x + (obj_cursor.rm_x - x) * 0.1;
				target_y = y + (obj_cursor.rm_y - y) * 0.1;
			}
		}
		
		can_zoom = true;
	break;
}
#endregion

#region Zoom Control
if(can_zoom) {
	var diff = abs(target_zoom - 1);
		
	if(1 <= target_zoom) {
		if(target_zoom < max_zoom and mouse_wheel_up()) {
			target_zoom += 0.2;
		}else
		if(mouse_wheel_down()) {
			target_zoom -= 0.4 * max(diff / 3, 0.33);
		}
	}else {
		if(mouse_wheel_up()) {
			target_zoom += 0.4 * max(diff / 0.75, 0.33);
		}else
		if(min_zoom < target_zoom and mouse_wheel_down()) {
			target_zoom -= 0.05;
		}
	}
		
	if(abs(target_zoom - 1) <= 0.1) {
		target_zoom = 1;
	}
		
	if(target_zoom > max_zoom) { target_zoom = max_zoom; }
	if(target_zoom < min_zoom) { target_zoom = min_zoom; }
}
#endregion

#region Movement State Machine
switch move_state {
	case 0: //Stopped
		if(target_x != x || target_y != y){
			move_state = 1;
		}
	break;
	
	case 1: //Move
		if(abs(target_x - x) < 0.01 && abs(target_y - y) < 0.01){
			x = target_x;
			y = target_y;
			
			move_state = 0;
		}
	break;
}
#endregion