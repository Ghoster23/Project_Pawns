///@argument start_tile
///@argument target_tile
///@argument pre_path
{
var str = argument0;
var trg = argument1;
var dct = argument2;

var nxt = trg;

var stk = ds_stack_create();

while(nxt != str){
	ds_stack_push(stk,nxt);
	nxt = dct[? nxt];
}

ds_map_destroy(dct);

return stk;
}