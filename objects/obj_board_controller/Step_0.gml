if(slt_inst != noone){
	switch slt_type {
		default:
			slt_inst = noone;
			slt_type = -1;
		break;
		
		case 0:
			#region Move
			switch slt_stt {
				case 0: //Init
					mov_pawn = slt_inst;
					
					if(is_descended(mov_pawn.object_index,obj_pawn_parent)){ 
						#region If a pawn was selected
						if(mov_pawn.moveable and mov_pawn.move == 2){ //If it can be moved and has a move
							if(mov_pawn.mov_list != -1){ //If available tiles have been calculated
								mov_list = mov_pawn.mov_list;
							}else {
								#region Calculate available tiles
								with mov_pawn {
									event_perform(ev_other,ev_user0);
								}
								#endregion
								mov_list = mov_pawn.mov_list;
							}
							slt_stt  = 1;
						}else {
							slt_stt = 3;
						}
						#endregion
					}else {
						slt_stt  = 3;
					}
				break;
				
				case 1: //Wait for tile selection
					if(mov_pawn != slt_inst){						
						if(ds_list_find_index(mov_list,slt_inst) != -1){ //If selected tile is available
							with mov_pawn {
								move = 1; //Movement has been used up for the round
								mov_trg  = other.slt_inst; //Set the target of the movement
								mov_path = scr_piece_make_path(instance_nearest(x,y,obj_tile),
																mov_trg, mov_path);
							}
							
							slt_stt  = 2; //Go to movement
						}else {
							slt_stt = 3;
						}
						
						mov_list = -1; //Reset list of available/highlighted tiles
					}
				break;
				
				case 2: //Move on-going
					if(mov_pawn.mov_trg == noone){
						slt_stt = 3;
					}
				break;
				
				case 3: //End
					mov_pawn = noone;
					
					slt_inst = noone;
					slt_type = -1;
					slt_stt  = 0;
				break;
			}
			#endregion
		break;
		
		case 1: //Act
			#region Act
			switch slt_stt {
				case 0: //Init
					if(slt_inst == global.turn){
						slt_inst.act = 1;
					}
				break;
				
				case 1: //Action Selection
				break;
				
				case 2: //Wait to finish action
				break;
				
				case 3: //End
				break;
			}
			#endregion
		break;
	}
}