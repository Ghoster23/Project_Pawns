/// @description Execution

switch state {
	case 0: //Target
		event_user(0);
	break;
	
	case 1: //Enacting
		event_user(1);
	break;
	
	case 2: //Conclusion
		event_user(2);
	break;
}