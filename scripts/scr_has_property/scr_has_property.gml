///@description Returns true if a board element (piece/tile) has the given property
///@argument instance_id
///@argument property
{
var iid = argument0;
var prp = argument1;

if(iid != noone and instance_exists(iid) and 0 < prp and prp < property.count){
	with(iid){
		for(var i = 0; i < property_count; i++){
			if(prp == properties[i]){
				return true;
			}
		}
	}
}

return false;
}