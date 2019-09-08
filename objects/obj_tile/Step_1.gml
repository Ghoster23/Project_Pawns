#region Init
if(init_state == 1){	
	var lf = cl_x > 0;
	var rg = cl_x < (room_width div cl_sz) - 1;
	var up = cl_y > 0;
	var dw = cl_y < (room_height div cl_sz) - 1;
	
	if(up) adj[0] = global.dg_tile[# cl_x, cl_y-1];
	if(up and rg) adj[1] = global.dg_tile[# cl_x+1, cl_y-1];
	if(rg) adj[2] = global.dg_tile[# cl_x+1, cl_y];
	if(dw and rg) adj[3] = global.dg_tile[# cl_x+1, cl_y+1];
	if(dw) adj[4] = global.dg_tile[# cl_x, cl_y+1];
	if(dw and lf) adj[5] = global.dg_tile[# cl_x-1, cl_y+1];
	if(lf) adj[6] = global.dg_tile[# cl_x-1, cl_y];
	if(up and lf) adj[7] = global.dg_tile[# cl_x-1, cl_y-1];
	
	tl_spr_id = scr_autotile_floor();
	
	init_state = 2;
}
#endregion