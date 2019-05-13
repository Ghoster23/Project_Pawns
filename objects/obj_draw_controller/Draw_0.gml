#region Board
if(ds_exists(ds_depthgrid, ds_type_grid)){
	#region Initialization
	//Assign grid and find instance count
	var depthgrid = ds_depthgrid;
	var instNum   = instance_number(obj_board_element);
	
	//If there are any
	if(instNum != 0){
		ds_grid_resize(depthgrid, 2, instNum);
	}
	
	//List all the:
	/// depth children
	/// visible
	/// instances
	var yy = 0;
	
	with(obj_board_element){
		if(visible){		
			depthgrid[# 0, yy] = id;
			
			if(not offset){
				depthgrid[# 1, yy] = y + layer * (-room_height);
			}else {
				depthgrid[# 1, yy] = y + offs + layer * (-room_height);
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
		
		#region Instances
		with(instanceID){
			//execute custom drawing if object has any
			if(draw_script != -1){
				script_execute(draw_script);
			}
			else {
				draw_self();
			}
		}
		#endregion
		
		yy += 1;
	}
	
	ds_grid_clear(ds_depthgrid, 0);
	#endregion
	
}else {
	ds_depthgrid = ds_grid_create(2,1);
}
#endregion

#region Highlighted Tiles
var cl = global.cell_size;

draw_set_alpha(0.3);
gpu_set_blendmode(bm_add)
	
var color = ds_map_find_first(highlights);

#region Iterate through colors
while(!is_undefined(color)){
	var list = ds_map_find_value(highlights, color);
		
	#region Get list
	if(!is_undefined(list) and ds_exists(list, ds_type_list)){
		var  i = 0;
		var tl = list[| i];
		
		#region Draw Highlights
		while(not is_undefined(tl)){
			draw_set_color(color);
			draw_rectangle(tl.x,tl.y,tl.x+cl,tl.y+cl,false);
			i += 1;
			tl = list[| i];
		}
		#endregion
	}
	#endregion
		
	color = ds_map_find_next(highlights, color);
}
#endregion

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);

var sl_p = obj_cursor.sl_tl;

draw_rectangle(sl_p[0]*cl-1,sl_p[1]*cl-1,(sl_p[0]+1)*cl+1,(sl_p[1]+1)*cl+1,true);
#endregion