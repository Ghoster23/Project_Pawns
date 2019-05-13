///@description Adds a property to a board element
///@argument instance_id
///@argument property
{
var iid = argument0;
var prp = argument1;

if(iid != noone and instance_exists(iid) and 0 < prp and prp < property.count){
	with(iid){
		properties[property_count] = prp;
		property_count += 1;
		return true;
	}
}

return false;
}