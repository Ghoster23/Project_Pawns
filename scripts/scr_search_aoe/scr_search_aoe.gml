///@argument start_tile_id
///@argument range
{
var tile = argument0;
var rng  = argument1;

var dirs = [0,1,2,3,4,5,6,7];

if(is_undefined(tile)){ return -1; }

return scr_board_search(tile,dirs,rng,1.5,0);
}