///@argument start_tile_id
///@argument diagonals
///@argument range
{
var tile = argument0;
var dgl  = argument1;
var rng  = argument2;

var lmt = 4;
if(dgl){ lmt = 8; }

if(is_undefined(tile)){ return -1; }

if(rng > 0){
	var res   = ds_list_create();  //List of reachable tiles
	var r_cnt = 0;                 //Count of tiles reachable
	var path  = ds_map_create();   //Map that contains the path (Key -> Tile id | Value -> Tile ids of tiles that reach Key tile)
	
	var check = ds_queue_create(); //Tiles to check next iteration
	var cnt   = 0;                 //Count of tiles to check
	
	#region First ITR
	with(tile){
		for(var i = 0; i < lmt; i++){
			if(adj[i] != noone){
				var tl = adj[i];
				if(tl.free){                     //If tile is free
					tl.srch_vis = true;          //Mark it as visited
					ds_queue_enqueue(check,tl);  //Add it to next iteration's queue
					cnt += 1;                    //Update queue length
					ds_map_add(path,tl,tile);    //Add it to path
					ds_list_add(res,tl);         //Add it to list of reachable tiles
					r_cnt += 1;
				}
			}
		}
	}
	rng -= 1;
	#endregion
	
	var n_check = ds_queue_create();
	var n_cnt  = 0;
	
	while(rng > 0){
		while(cnt > 0){
			tile = ds_queue_dequeue(check);  //Get next tile to expand
			cnt -= 1;                        //Update queue length
			
			with(tile){
				for(var i = 0; i < lmt; i++){
					if(adj[i] != noone){
						var tl = adj[i];
						if(tl.free and not tl.srch_vis){   //If tile is free and not visited by search
							tl.srch_vis = true;            //Has been visited by search
							ds_queue_enqueue(n_check,tl);  //Add it to tiles to check queue
							n_cnt += 1;                    //Update queue length
							ds_map_add(path,tl,tile);      //Add it to path
							ds_list_add(res,tl);           //Add it to the list of reachable tiles
							r_cnt += 1;
						}
					}
				}
			}
		}
		
		#region Swap vars
		var temp = n_check;
		n_check   = check;
		check     = temp;
		
		temp  = n_cnt;
		n_cnt = cnt;
		cnt   = 0;
		#endregion
		
		rng -= 1;
	}
	
	for(var i = 0; i < r_cnt; i++){
		var tl = res[| i];
		tl.srch_vis = false;
	}

	ds_queue_destroy(check);
	ds_queue_destroy(n_check);

	return [res,path];
}
}