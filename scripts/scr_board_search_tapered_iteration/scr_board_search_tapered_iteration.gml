///@description Iteration of a board search
///@argument directions
///@argument direction_count
///@argument data_structure_array [check, n_check, path, reacheable, r_count]
///@argument taper
{
var dirs = argument0;
var dcnt = argument1;
var data = argument2;
var taper = argument3;

var check     = data[0];
var n_check = data[1];
var path       = data[2];
var res          = data[3];
var r_cnt      = data[4];

var c_tile = ds_queue_dequeue(check);  //Get the first tile in the queue

//While there are tiles to check
while(!is_undefined(c_tile) and instance_exists(c_tile)){
	with(c_tile) {
		//For every direction to check
		for(var i = 0; i < dcnt; i++){
			if(dirs[i] mod 2 == 0){
				var dec = 1;
			
				//If there is a tile in that direction
				if(adj[dirs[i]] != noone and c_tile.srch_rng > dec){
					var tl = adj[dirs[i]];
				
					//If the tile is free and has not been visited
					if(tl.free and not tl.srch_vis){
						tl.srch_vis = true;                            //Mark it as visited
						tl.srch_rng = c_tile.srch_rng - dec;
						ds_queue_enqueue(n_check,tl);  //Add it to next iteration's queue
			
						ds_map_add(path,tl,c_tile);  //Add it to path
						ds_list_add(res,tl);                  //Add it to list of reachable tiles
						r_cnt += 1;
					}
				}
			}
		}
		for(var i = 0; i < dcnt; i++){
			if(dirs[i] mod 2 != 0){
				var dec = taper;
			
				//If there is a tile in that direction
				if(adj[dirs[i]] != noone and c_tile.srch_rng > dec){
					var tl = adj[dirs[i]];
				
					//If the tile is free and has not been visited
					if(tl.free and not tl.srch_vis){
						tl.srch_vis = true;                            //Mark it as visited
						tl.srch_rng = c_tile.srch_rng - dec;
						ds_queue_enqueue(n_check,tl);  //Add it to next iteration's queue
			
						ds_map_add(path,tl,c_tile);  //Add it to path
						ds_list_add(res,tl);                  //Add it to list of reachable tiles
						r_cnt += 1;
					}
				}
			}
		}
	}
	
	c_tile = ds_queue_dequeue(check);  //Get the next tile to check
}

return r_cnt;
}