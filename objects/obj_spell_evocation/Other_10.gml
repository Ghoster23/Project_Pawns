///@description Target
switch trg_state {
	case 0: //Determine Targetable tiles
		var info = [-1,-1];
		
		switch trg_param[0] {
			default:
			break;
		
			case target_param.aoe:
			case target_param.wall:
			case target_param.line:
				info = scr_search_flood(caster.tile, true, 4);
				trg_lst_trgable = info[0];
				ds_map_destroy(info[1]);
			break;
		
			case target_param.touch:
				info = scr_search_flood(caster.tile, true, 1);
				trg_lst_trgable = info[0];
				ds_map_destroy(info[1]);
			break;
		
			case target_param.me:
				trg_lst_trgable = ds_list_create();
				ds_list_add( trg_lst_trgable, caster.tile);
			break;
		}
		scr_debug_message_ds_list(trg_lst_trgable);
		//Highlight targetable spots
		ds_map_add(obj_draw_controller.highlights, c_green, trg_lst_trgable);
		
		trg_state = 1;
	break;
	
	case 1: //Wait for selection and calculate affected tiles
		#region Select and check tile
		if(global.key_active[key_id.move]) {
			if(ds_list_find_index( trg_lst_trgable, sl_tl) != -1){
				#region Determine affected tiles
				switch trg_param[0] {
					default:
					break;
		
					case target_param.aoe:
					case target_param.wall:
					case target_param.line:
						targets = scr_spell_target_list(sl_tl,trg_param[1],trg_param[2],trg_param[3]);
					break;
		
					case target_param.touch:
						targets = ds_list_create();
						ds_list_add(targets, sl_tl);
					break;
		
					case target_param.me:
						targets = ds_list_create();
						ds_list_add(targets, caster.tile);
					break;
				}
				#endregion
				
				trg_state = 2;
			}			
		}
		#endregion
	break;
	
	case 2: //Save tiles to affect and advance
		ds_map_delete(obj_draw_controller.highlights, c_green);
		ds_list_destroy(trg_lst_trgable);
		trg_lst_trgable = -1;
		ds_map_add(obj_draw_controller.highlights, c_red, targets);
		
	break;
}