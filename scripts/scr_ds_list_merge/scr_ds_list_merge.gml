///@description Returns a ds_list with the values of the two received
///@param ds_list_1
///@param ds_list_2
///@param duplicates
{
var ds1 = argument0;
var ds2 = argument1;
var dup = argument2;

var val = ds2[| 0];

while(!is_undefined(val)){
	if(dup){
		ds_list_add(ds1,val);
	}else {
		if(ds_list_find_index(ds1,val) == -1){
			ds_list_add(ds1,val);
		}
	}
}

ds_list_destroy(ds2);
return ds1;
}