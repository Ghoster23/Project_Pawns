///@argument start_tile_id
///@argument direction
///@argument range
{
var tile = argument0;
var dir  = argument1;
var rng  = argument2;

if(is_undefined(tile)){ return -1; }

return scr_board_search(tile,[dir],rng);
}