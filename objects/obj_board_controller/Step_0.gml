switch(global.brd_stt) {
	case 0: // Idle
	break;
	
	case 1: #region Create
		x_cells = board_width  div global.cell_size;
		y_cells = board_depth  div global.cell_size;
		z_cells = board_height div global.cell_size;
		
		global.dl_board_layers = ds_list_create();
		
		for(var i = 0; i < z_cells; i++) {
			ds_list_add(global.dl_board_layers, ds_grid_create(x_cells, y_cells));
		}
		#endregion
	break;
	
	case 2: // Load
	break;

	case 3: #region Run
		#region Select Instance
		var in = -4;
		var tp = -1;
		
		if(global.key_active[key_id.l_click]){
			tp = 0;
		}else
		if(global.key_active[key_id.r_click]){
			tp = 1;
		}
		
		if(tp != -1){
			var brd_layer = global.dl_board_layers[sl_cell[0]];
			in = brd_layer[# sl_cell[1], sl_cell[2]];
			
			if(in != noone){
				if(not instance_exists(in)){
					brd_layer[# sl_cell[1], sl_cell[2]] = noone;
					in = noone;
				}
			}
			
			slt_inst = in;
			slt_type = tp;
		}
		#endregion

		#region Selected Instance Handling
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
		#endregion
		#endregion
	break;
	
	case 4: // Save
	break;
	
	case 5: #region Delete
		for(var i = 0; i < z_cells; i++) {
			var brd_layer = global.dl_board_layers[| i];
			
			ds_grid_destroy(layer);
		}
		
		ds_list_destroy(global.dl_board_layers);
		global.dl_board_layers = -1;
		
		board_width  = 0;
		board_depth  = 0;
		board_height = 0;
		
		x_cells = 0;
		y_cells = 0;
		z_cells = 0;
		#endregion
	break;
}