/// @description Enactment
switch ena_state {
	case 0: //Preparation
		
		ena_state = 1;
	break;
	
	case 1: //Do spell effect
		switch ena_param {
			case enact_param.create:
				#region
				var targ = targets[| 0];
				ds_list_delete(targets, 0);
				
				while(not is_undefined(targ)){
					if(not targ.blocked){
						switch ele_param {
							case elemental_param.air:
								/*
								if(not targ.free){
									get direction to tile
									if opposite direction not blocked
									apply push to piece in opposite direction
									else
									damage piece
								}
								*/
							break;
			
							case elemental_param.dark:
							break;
			
							case elemental_param.earth:
								if(targ.free){
									instance_create_layer(targ.cl_x * global.cell_size, 
														  targ.cl_y * global.cell_size,
														  layer, obj_solid_parent);
								}else {
									var pc = global.dg_objs[# targ.cl_x, targ.cl_y];
									
									pc.hp -= 1;
									
									scr_status_apply(pc, status.cripple, 5);
								}
							break;
			
							case elemental_param.fire:
								//Burn the tile
								scr_status_apply(targ, status.burn, 5);
						
								//If a piece is on the tile
								if(not targ.free){
									var pc = global.dg_objs[# targ.cl_x, targ.cl_y];
									
									//Burn the piece
									scr_status_apply(pc, status.burn, 5);
								}
							break;
			
							case elemental_param.light:
							break;
			
							case elemental_param.water:
								//Wet the tile
								scr_status_apply(targ, status.wet, 5);
								
								//If a piece is on the tile
								if(not targ.free){
									var pc = global.dg_objs[# targ.cl_x, targ.cl_y];
									
									//Burn the piece
									scr_status_apply(pc, status.wet, 5);							
								}
							break;
						}
					}
					
					targ = targets[| 0];
					ds_list_delete(targets, 0);
				}
				#endregion
			break;
			
			case enact_param.kinesis:
			break;
			
			case enact_param.destroy:
			break;
		}
		
		ds_list_destroy(targets);
		targets   = -1;
		ena_state = 2;
	break;
	
	case 2:
		instance_destroy();
	break;
}