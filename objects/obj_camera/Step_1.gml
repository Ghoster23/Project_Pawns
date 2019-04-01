//Target
switch room {
	default:
		if(target != noone){
			cam_x_t = target.x + 32;
			cam_y_t = target.y + 32;
		}else {
			cam_x_t = room_width  div 2;
			cam_y_t = room_height div 2;
		}
	break;
}

//Movement State
switch m_state {
	case 0: //Stopped
		if(cam_x_t != x || cam_y_t != y){
			m_state = 1;
		}
	break;
	
	case 1: //Move
		if(abs(cam_x_t - x) < 0.01 && abs(cam_y_t - y) < 0.01){
			x = cam_x_t;
			y = cam_y_t;
			
			cam_x_c = x;
			cam_y_c = y;
			
			m_state = 0;
		}
	break;
}