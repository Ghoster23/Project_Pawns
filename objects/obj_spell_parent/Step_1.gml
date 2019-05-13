/// @description State Machine

sl_tl = obj_cursor.tile_id;

switch state {
	case 0: //Target
		if(trg_state == 3){
			state = 1;
		}
	break;
	
	case 1: //Enacting
		if(ena_state == 3){
			state = 2;
		}
	break;
	
	case 2: //Element
		instance_destroy();
	break;
}