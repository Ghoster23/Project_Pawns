///@argument start_tile_id
///@argument dirs
///@argument range
///@argument taper_val
///@argument block_type - [0 - check free, 1 - check blocked]
{
var tile = argument0;
var dirs = argument1;
var rng  = argument2;
var tpr  = argument3;
var blk  = argument4;

var dcnt = array_length_1d(dirs);

if(is_undefined(tile)){ return -1; }

if(rng > 0){
	var res = ds_list_create();  //List of reachable tiles
	ds_list_add(res, tile);
	tile.srch_vis = true;
	tile.srch_rng = rng + (tpr != 1 ? 1 : 0);
	
	var r_cnt = 1;   //Count of tiles reachable
	
	var path  = ds_map_create();   //Map that contains the path (Key -> Tile id | Value -> Tile ids of tiles that reach Key tile)
	ds_map_add(path,"Start",tile);
	
	var check = ds_queue_create(); //Tiles to check in the nth iteration
	
	ds_queue_enqueue(check,tile);  //Place the beggining tile in the search queue
	
	var n_check = ds_queue_create(); //Tiles to check in the nth+1 iteration
	
	while(rng > 0){
		if(tpr != 1){
			r_cnt = scr_board_search_tapered_iteration(dirs, dcnt, [check, n_check, path, res, r_cnt], tpr, blk);
		}else {
			r_cnt = scr_board_search_iteration(dirs, dcnt, [check, n_check, path, res, r_cnt], blk);
		}
		
		#region Swap queues
		var temp = n_check;
		n_check  = check;
		check    = temp;
		#endregion
		
		rng -= 1;
		scr_debug_message_ds_list(res);
	}
	
	for(var i = 0; i < r_cnt; i++){
		var tl = res[| i];
		tl.srch_vis = false;
		tl.srch_rng = 0;
	}

	ds_queue_destroy(check);
	ds_queue_destroy(n_check);

	return [res,path];
}
}