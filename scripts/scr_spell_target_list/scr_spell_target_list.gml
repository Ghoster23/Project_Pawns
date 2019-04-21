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

var rng = 1;

for(var i = 0; i < t_modc; i++){
	var md = t_mods[i];
	
	if(md[0] == target_mod.range){
		rng += md[1];
	}
}

if(rng != 0){
	var t_res = -1;
		
	//Search the board
	switch t_type {
		case target_param.aoe:
			t_res = scr_search_aoe(s_cell, rng);
		break;
	
		case target_param.line:
			var dir = scr_brd_dir_between_tiles(caster.tile, s_cell);
			t_res = scr_search_line(s_cell, dir, 1 + rng);
		break;
		
		case target_param.wall:
			var dir = scr_brd_dir_between_tiles(caster.tile, s_cell);
			t_res = scr_search_wall(s_cell, dir, 1 + rng);
		break;
	}
	
	ds_map_destroy(t_res[1]); //Destroy the path info
	
	res = t_res[0];
}
	
return res;
}