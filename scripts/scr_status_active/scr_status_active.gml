///@description Returns true if a given board element has a specified status on them
///@argument instance_id
///@argument status_id
{
var iid = argument0;
var sid = argument1;

if(sid < status.count){
	if(iid != noone and instance_exists(iid)){
		return 0 < iid.stu_active[sid] and iid.stu_active[sid] < 6;
	}
}

return false;
}