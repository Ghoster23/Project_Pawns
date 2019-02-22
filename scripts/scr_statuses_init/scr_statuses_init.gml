///@argument statuses_array_opt
///To mask a status, init the array with 2 in a given position
///[ burning, wet, eletric, decay]
{
stu_active = [0,0,0,0];
stu_turns  = [0,0,0,0];

if(argument_count > 0){
	stu_active = argument[0];
}
}