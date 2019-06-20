sl_tl[0] = clamp(mouse_x div global.cell_size, 0, room_width  div global.cell_size - 1);
sl_tl[1] = clamp(mouse_y div global.cell_size, 0, room_height div global.cell_size - 1);
		
tile_id  = global.dg_tile[# sl_tl[0],sl_tl[1]];

switch global.brd_stt {
	case 0: //Give it a step for all pieces to be in place
		if(global.pawn_cnt > 0){
			global.brd_stt = 1;
		}
	break;
	
	case 1:
		#region Advance Turn				
		#region Round Over
		if(global.turn_counter == global.pawn_cnt){ 
			global.turn_counter   = 0; //Reset turn counter
			global.round_counter += 1; //Increment number of rounds elapsed
		}
		#endregion
		
		var next = global.dl_pawns[| global.turn_counter];
		
		#region Out-of-Bounds Exception
		if(is_undefined(next)){
			global.turn_counter  = 0;
			global.pawn_cnt     -= 1;
			exit;
		}
		#endregion
		
		#region Non-Existent instance Exception
		if(not instance_exists(next)){
			ds_list_delete(global.dl_pawns,global.turn_counter);
			global.turn_counter -= 1;
			global.pawn_cnt     -= 1;
			exit;
		}
		#endregion
		
		global.turn = next; //Update who's turn it is
		
		//Refresh the pawns 'tokens'
		with next {
			act  = 2;
			move = 2;
		}
		
		global.turn_counter += 1; //Turn has started
		
		global.brd_stt = 2;
		#endregion
	break;
	
	case 2://Wait for the turn to be concluded
		if(global.turn == noone){
			global.brd_stt = 1;
		}
	break;
}