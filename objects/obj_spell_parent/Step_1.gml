/// @description State Machine

sl_tl = obj_cursor.tile_id;

switch state {
	case 0: //Target
		if(trg_state == 2){
			//state = 1;
			alarm[0] = 60 * room_speed;
		}
	break;
	
	case 1: //Enacting
		if(concluded){
			state = 2;
		}
	break;
	
	case 2: //Conclusion
	break;
}