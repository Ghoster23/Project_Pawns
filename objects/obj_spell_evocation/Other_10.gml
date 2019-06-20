///@description Target
switch trg_state {
	case 0: //Determine Targetable tiles
		var info = [-1,-1];
		
		switch trg_param[0] {
			default:
			break;
		
			case target_param.line:
				info = scr_search_flood(caster.tile, true, 1, 1, 0);
				trg_lst_trgable = info[0];
				ds_list_delete(trg_lst_trgable,0);
				ds_map_destroy(info[1]);
			break;
			
			case target_param.aoe:
				info = scr_search_flood(caster.tile, true, 2, 1.5, 0);
				trg_lst_trgable = info[0];
				ds_map_destroy(info[1]);
			break;
			
			case target_param.wall:
				info = scr_search_flood(caster.tile, true, 2, 1.5, 0);
				trg_lst_trgable = info[0];
				ds_list_delete(trg_lst_trgable,0);
				ds_map_destroy(info[1]);
			break;
		
			case target_param.touch:
				info = scr_search_flood(caster.tile, true, 1, 1, 0);
				trg_lst_trgable = info[0];
				ds_map_destroy(info[1]);
			break;
		}
		
		//Highlight targetable spots
		ds_map_add(obj_draw_controller.highlights, c_green, trg_lst_trgable);
		
		trg_state = 1;
	break;
	
	case 1: //Wait for selection and calculate affected tiles
		#region Select and check tile
		if(global.key_active[key_id.l_click]) {
			if(ds_list_find_index( trg_lst_trgable, sl_tl) != -1){
				#region Determine affected tiles
				switch trg_param[0] {
					default:
					break;
					
					case target_param.line:
					case target_param.aoe:
					case target_param.wall:
						targets = scr_spell_target_list(sl_tl,trg_param[0],trg_param[1],trg_param[2]);
					break;
		
					case target_param.touch:
						targets = ds_list_create();
						ds_list_add(targets, sl_tl);
					break;
				}
				#endregion
				
				ds_map_delete(obj_draw_controller.highlights, c_green);
				ds_map_add(obj_draw_controller.highlights, c_red, targets);
				alarm[1] = 1 * room_speed;
				
				trg_state = 2;
			}			
		}
		#endregion
	break;
	
	case 2: //Wait for confirmation
		if(global.key_active[key_id.l_click] and alarm[1] == -1){
			#region Advance to enactment
			ds_list_destroy(trg_lst_trgable);
			trg_lst_trgable = -1;
			ds_map_delete(obj_draw_controller.highlights, c_red);
			trg_state = 3;
			#endregion
		}else if(global.key_active[key_id.r_click]){
			#region Go back to tile selection
			ds_map_delete(obj_draw_controller.highlights, c_red);
			ds_list_destroy(targets);
			targets = -1;
			ds_map_add(obj_draw_controller.highlights, c_green, trg_lst_trgable);
			trg_state = 1;
			#endregion
		}
	break;
	
	case 3:
	break;
}