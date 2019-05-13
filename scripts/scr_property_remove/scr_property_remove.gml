///@description Adds a property to a board element
///@argument instance_id
///@argument property
{
var iid = argument0;
var prp = argument1;

var found = false;

if(iid != noone and instance_exists(iid) and 0 < prp and prp < property.count){
	with(iid){
		for(var i = 0; i < property_count; i++){
			if(properties[i] == prp){
				properties[i] = properties[i+1];
				found = true;
			}else if(found){
				if(i < property_count - 1){
					properties[i] = properties[i+1];
				}else {
					properties[i]   = -1;
					property_count -=  1;
					return true;
				}
			}
		}
	}
}

return false;
}