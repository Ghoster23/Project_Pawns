switch global.brd_stt {
	case 0: //Give it a turn for all pieces to be in place
		if(global.pawn_cnt > 0){
			global.brd_stt = 1;
		}
	break;
	
	case 1:
		#region Advance Turn				
		#region Round Over
		if(turn_counter == 0){
			with(obj_pawn_parent){
				if(mov_list == -1){
					event_perform(ev_other,ev_user0);
				}
			}
		}
		#endregion
				
		var next = global.dl_pawns[| turn_counter];
		
		#region Out-pf-Bounds Exception
		if(is_undefined(next)){
			turn_counter     = 0;
			global.pawn_cnt -= 1;
			exit;
		}
		#endregion
		
		#region Non-Existent instance Exception
		if(not instance_exists(next)){
			ds_list_delete(global.dl_pawns,turn_counter);
			turn_counter    -= 1;
			global.pawn_cnt -= 1;
			exit;
		}
		#endregion
		
		global.turn = next;
				
		with next {
			act  = 2;
			move = 2;
		}
				
		turn_counter += 1;
				
		if(turn_counter == global.pawn_cnt){ turn_counter = 0; }
		
		global.brd_stt = 2;
		#endregion
	break;
	
	case 2:
		if(global.turn == noone){
			global.brd_stt = 1;
		}
	break;
}