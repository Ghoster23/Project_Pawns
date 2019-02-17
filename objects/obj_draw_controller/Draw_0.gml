#region Highlighted Tiles
var cl = global.cell_size;

var hg_m_l = obj_board_controller.mov_list;

if(hg_m_l != -1){
	draw_set_alpha(0.3);
	gpu_set_blendmode(bm_add);
	
	var  i = 0;
	var tl = hg_m_l[| i];
	
	#region Draw Highlights
	while(not is_undefined(tl)){
		draw_rectangle(tl.x,tl.y,tl.x+cl,tl.y+cl,false);
		i += 1;
		tl = hg_m_l[| i];
	}
	#endregion
	
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

var sl_p = obj_cursor.sl_tl;

draw_rectangle(sl_p[0]*cl-1,sl_p[1]*cl-1,(sl_p[0]+1)*cl+1,(sl_p[1]+1)*cl+1,true);
#endregion

#region Pieces
if(ds_exists(ds_depthgrid, ds_type_grid)){
	#region Initialization
	//Assign grid and find instance count
	var depthgrid = ds_depthgrid;
	var instNum   = instance_number(obj_depth_parent);
	
	//If there are any
	if(instNum != 0){
		ds_grid_resize(depthgrid, 2, instNum);
	}
	
	//List all the:
	/// depth children
	/// visible
	/// instances
	var yy = 0;
	
	with(obj_depth_parent){
		if(visible){		
			depthgrid[# 0, yy] = id;
			
			if(not offset){
				depthgrid[# 1, yy] = y;
			}else {
				depthgrid[# 1, yy] = y + offs;
			}
			
			yy += 1;
		}
	}
	
	//Sort the instances by Y
	ds_grid_sort(ds_depthgrid, 1, true);
	#endregion
	
	#region Draw everything
	yy = 0;
	
	repeat(instNum){
		var instanceID = ds_depthgrid[# 0, yy];
		var instanceY  = ds_depthgrid[# 1, yy];
		
		#region Instances
		with(instanceID){
			//execute custom drawing if object has any
			if(draw_script != "NULL"){
				script_execute(draw_script);
				
			}
			else {
				draw_self();
				
				shader_reset();
			}
		}
		#endregion
		
		yy += 1;
	}
	
	ds_grid_clear(ds_depthgrid, 0);
	#endregion
	
}else {
	ds_depth_grid = ds_grid_create(2,1);
}
#endregion