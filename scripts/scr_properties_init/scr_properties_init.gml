///@argument properties(opt)
///Pass properties as arguments
{
var count  = 0;

for(var i = 0; i < argument_count; i++){
	var prp = argument[i];
	
	if(prp < property.count){
		properties[count] = prp;
		count += 1;
	}
}

property_count = count;
}