// Inherit the parent event
event_inherited();

#region Drop down menus
var e_tp = scr_window_list_selector( element_type, lf, tp, lst_elements, 0, rg - lf);

if(e_tp != element_type) {
	element_type = e_tp;
	
	with select_popup[1] { closed = true; }
	with select_popup[2] { closed = true; }
}

switch( element_type ) {
	case board_element.none:
	break;
	
	case board_element.tile:
		type = scr_window_list_selector( type, lf, tp + 48 * cm, lst_tiles, 1, rg - lf);
	break;
	
	case board_element.piece:
		var _type = scr_window_list_selector( type, lf, tp + 48 * cm, lst_pieces, 1, rg - lf);
		
		if(_type != type) {
			with select_popup[2] { closed = true; }
		}
		
		type = _type;
		
		switch( type ) {
			case piece_type.none:
			break;
			
			case piece_type.block:
				sub_type = scr_window_list_selector( sub_type, lf, tp + 96 * cm, lst_block, 2, rg - lf);
			break;
			
			case piece_type.pawn:
				sub_type = scr_window_list_selector( sub_type, lf, tp + 96 * cm,  lst_pawn, 2, rg - lf);
			break;
		}
	break;
}

#endregion