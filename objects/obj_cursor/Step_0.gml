switch room {
	default:
		#region Movement
		if(global.key_active[key_id.move] and alarm[0] == -1){
			alarm[0] = 0.33 * room_speed;
			
			if(moving == noone){
				#region Select Piece
				var mx = sl_tl[0];
				var my = sl_tl[1];
			
				var inst = global.ds_grid_objs[# mx, my];
			
				if(inst != noone){
					if(instance_exists(inst)){
						if(inst.moveable){
							moving = inst;
							hg_grid = inst.mov_grid;
							hg_type = 0;
							hg_pos  = [mx,my];
						}
					}else {
						global.ds_grid_objs[# mx, my] = noone;
					}
				}
				#endregion
			}else {
				#region Movement
				var mx = sl_tl[0];
				var my = sl_tl[1];
				
				var pc_x = hg_pos[0];
				var pc_y = hg_pos[1];
				
				var inst = global.ds_grid_objs[# pc_x, pc_y];
				
				//Get info
				var mv_g = inst.mov_grid;
				var len  = array_length_1d(mv_g);
				var mv_l = len div 2;
					
				//Move calculation
				var mv_x = mx - pc_x + mv_l;
				var mv_y = pc_y - my + mv_l;
				
				if((0 <= mv_x and mv_x < len) and
				   (0 <= mv_y and mv_y < len)){
					var line = mv_g[mv_y];
					
					if(line[mv_x] == 1){
						var mov  = false;
					
						#region Collision Check
						var coll = global.ds_grid_objs[# mx, my];
					
						if(coll == noone){
							mov = true;
						}else
						if(not instance_exists(coll)){
							mov = true;
							global.ds_grid_objs[# mx, my] = noone;
						}
						#endregion
					
						if(mov){
							#region Move Piece
							with inst {
								x = mx * global.cell_size;
								y = my * global.cell_size;
							}
							#endregion
						}
					}
				}
				
				moving = noone;
				#endregion
			}
		}
		#endregion
	break;
}