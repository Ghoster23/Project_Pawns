#region Moving
if(mov_trg != noone){
	switch mov_stt {
		case 0: //Determine enxt step
			mov_nxt = ds_stack_pop(mov_path);
			mov_stt = 1;
		break;
		
		case 1: //Move to next tile
			if(x != mov_nxt.x or y != mov_nxt.y){
				x = scr_approach(x,mov_nxt.x,4);
				y = scr_approach(y,mov_nxt.y,4);
			}else {
				mov_stt = 2;
			}
		break;
		
		case 2: //Check if arrived
			if(mov_trg == mov_nxt){
				mov_stt = 0;     //Reset movement state
				
				//Reset AUX variables
				mov_trg = noone;
				mov_nxt = noone;
				
				#region Data structures reset
				//Delete path data structure
				ds_stack_destroy(mov_path);
				mov_path = -1;
				
				//Delete available tiles data structure
				ds_list_destroy(mov_list);
				mov_list = -1;
				#endregion
			}else {
				mov_stt = 0;
			}
		break;
	}
}
#endregion