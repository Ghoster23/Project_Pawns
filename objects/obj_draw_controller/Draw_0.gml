#region Highlighted Tiles
var hg_g = obj_cursor.hg_grid;
var hg_t = obj_cursor.hg_type;
var hg_p = obj_cursor.hg_pos;

var cl = global.cell_size;

if(hg_t != -1){
	var len = array_length_1d(hg_g);
	
	hg_p[0] = hg_p[0] - len div 2;
	hg_p[1] = hg_p[1] - len div 2;
	
	#region Colour
	switch hg_t {
		default:
			draw_set_color(c_white);
		break;
					
		case 0:
			draw_set_color(c_green);
		break;
	}
	#endregion
	
	draw_set_alpha(0.3);
	gpu_set_blendmode(bm_add);
	
	#region Draw Highlights
	for(var i = 0; i < len; i++){
			var line = hg_g[i];
			
		for(var j = 0; j < len; j++){
			if(line[j] == 1){
				var xx = (hg_p[0] + j) * cl;
				var yy = (hg_p[1] + i) * cl;
				
				draw_rectangle(xx,yy,xx+cl,yy+cl,false);				
			}
		}
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