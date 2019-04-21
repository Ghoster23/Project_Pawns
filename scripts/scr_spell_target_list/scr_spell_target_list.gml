///@description Returns an array of positions in the room grid
///@param start_cell
///@param target_type
///@param target_mod_count
///@param target_mods
{
var s_cell = argument0;
var t_type = argument1;
var t_modc = argument2;
var t_mods = argument3;

var res = -1;

var rng = 2;

for(var i = 0; i < t_modc; i++){
	var md = t_mods[i];
	
	if(md[0]  == target_mod.range){
		rng += md[1];
	}
}

if(rng != 0){
	var t_res = -1;
		
	//Search the board
	switch t_type {
		case target_param.aoe:
				
		break;
	
		case target_param.line:
			var dir = scr_brd_dir_between_tiles(caster.tile, s_cell);
			t_res = scr_search_line(s_cell, dir, rng);
		break;
		
		case target_param.wall:
			var dir = scr_brd_dir_between_tiles(caster.tile, s_cell);
			t_res = scr_search_wall(s_cell, dir, rng);
		break;
	}
		
	ds_map_destroy(t_res[1]); //Destroy the path info
		
	//Add targets found
	if(res != -1){
		scr_ds_list_merge(res,t_res[0],false); 
	}else {
		res = t_res[0];
	}
}
	
return res;
}