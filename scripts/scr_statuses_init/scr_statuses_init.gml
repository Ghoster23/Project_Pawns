///@argument statuses_array_opt
///To mask a status pass it as an argument
{
stu_active = array_create(status.count, 0);
stu_turns  = array_create(status.count, 0);

for(var i = 0; i < argument_count; i++){
	var stt = argument[i];
	
	if(stt < status.count){
		stu_active[stt] = -1;
	}
}
}