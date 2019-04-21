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
	case 4:
		dirs = [2,6];
	break;
	
	case 2:
	case 6:
		dirs = [0,4];
	break;
	
	case 1:
	case 5:
		dirs = [3,7];
	break;
	
	case 3:
	case 7:
		dirs = [1,5];
	break;
}

#endregion

if(is_undefined(tile)){ return -1; }

return scr_board_search(tile,dirs,rng,1,1);
}