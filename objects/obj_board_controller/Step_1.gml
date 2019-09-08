var delta = 0;

if(mouse_wheel_up()) {
	delta =  1;
}else
if(mouse_wheel_down()) {
	delta = -1;
}

sl_cell[0] = clamp(sl_cell[0] + delta,                   0, z_cells - 1);
sl_cell[1] = clamp(obj_cursor.rm_x div global.cell_size, 0, x_cells - 1);
sl_cell[2] = clamp(obj_cursor.rm_y div global.cell_size, 0, y_cells - 1);

switch global.brd_stt {
	case 0: // Idle
	break;
	
	case 1: // Creating
	case 2: // Load
		#region
		if(global.dl_board_layers != -1 and ds_exists(global.dl_board_layers, ds_type_list)) {
			global.brd_stt = 3;
		}
		#endregion
	break;
	
	case 3: #region Run
		switch run_state {
			case 0: //Give it a step for all pieces to be in place
				if(global.pawn_cnt > 0){
					run_state = 1;
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
		
				run_state = 2;
				#endregion
			break;
	
			case 2://Wait for the turn to be concluded
				if(global.turn == noone){
					run_state = 1;
				}
			break;
		}
		#endregion
	break;
	
	case 4: // Save
	break;
	
	case 5: #region Delete
		if(not ds_exists(global.dl_board_layers, ds_type_list)) {
			global.brd_stt = 0;
		}
		#endregion
	break;
}