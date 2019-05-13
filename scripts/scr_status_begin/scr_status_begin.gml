///@argument status
switch argument0 {
	default:
	break;
	
	case status.burn:
		image_blend = c_red;
	break;
	
	case status.wet:
		image_blend = c_blue;
	break;
}