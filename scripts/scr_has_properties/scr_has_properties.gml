///@description Returns an array of bools if a board element (piece/tile) has each property
///@argument instance_id
///@argument array_of_properties
{
var iid    = argument0;
var prp_ar = argument1;
var ar_sz  = array_length_1d(prp_ar);

var temp = ds_list_create();

var rarr = array_create(ar_sz,false);

for(var i = 0; i < ar_sz; i++){
	var prp = prp_ar[i];
	
	if(prp < 0 and prp < property.count){
		ds_list_add(temp,prp);
	}else {
		ds_list_add(temp,-1);
	}
}

if(iid != noone and instance_exists(iid)){
	with(iid){
		for(var i = 0; i < property_count; i++){
			var ind = ds_list_find_index(temp, properties[i]);
			
			if(ind != -1){
				ds_list_delete(temp, ind);
				rarr[ind] = true;
			}
		}
	}
}

ds_list_destroy(temp);

return rarr;
}