///@argument start_tile_id
///@argument dir_wall_faces
///@argument range
{
var tile = argument0;
var dir  = argument1;
var rng  = argument2;

var dirs = [0,0];

#region Determine expansion directions
switch dir {
	case 0:
	case 2:
		dirs = [1,3];
	break;
	
	case 1:
	case 3:
		dirs = [2,4];
	break;
	
	case 4:
	case 6:
		dirs = [5,7];
	break;
	
	case 5:
	case 7:
		dirs = [4,6];
	break;
}

#endregion

if(is_undefined(tile)){ return -1; }

return scr_board_search(tile,dirs,rng);
}