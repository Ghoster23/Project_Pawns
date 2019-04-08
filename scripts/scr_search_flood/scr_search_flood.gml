///@argument start_tile_id
///@argument diagonals
///@argument range
{
var tile = argument0;
var dgl  = argument1;
var rng  = argument2;

var dirs = [0,1,2,3];

if(dgl){ 
	dirs = [0,1,2,3,4,5,6,7];
}

if(is_undefined(tile)){ return -1; }

return scr_board_search(tile,dirs,rng);
}