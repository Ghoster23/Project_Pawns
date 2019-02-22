///@argument action_id
///@argument target_id
///@argument action_parameters
{
switch argument0 {
	default:
	break;
	
	case action.burn:
		scr_status_apply(argument1,status.burn,argument2);
	break;
}
}