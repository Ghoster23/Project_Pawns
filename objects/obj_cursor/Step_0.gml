switch room {
	default:
		var in = -4;
		var tp = -1;
		
		if(global.key_active[key_id.move]){
			tp = 0;
		}else
		if(global.key_active[key_id.act]){
			tp = 1;
		}
		
		if(tp != -1){
			in = global.dg_objs[# sl_tl[0],sl_tl[1]];
			
			if(in != noone){
				if(not instance_exists(in)){
					global.dg_objs[# sl_tl[0],sl_tl[1]] = noone;
					in = tile_id;
				}
			}else {
				in = tile_id;
			}
			
			with obj_board_controller {
				slt_inst = in;
				slt_type = tp;
			}
		}
	break;
}