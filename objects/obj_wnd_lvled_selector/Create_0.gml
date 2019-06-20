event_inherited();

width  = 200;
height = 200;

moveable  = false;
closeable = false;

title = "Selector";

lst_elements = ["None", "tile", "piece"];
lst_tiles    = ["None", "dirt", "grass", "stone", "metal", "water"];
lst_pieces   = ["None", "pawn", "block"];
lst_pawn     = ["None", "player", "npc"];
lst_block    = ["None", "stone", "wood", "metal"];

element_type = board_element.none;
type         = 0;
sub_type     = 0;

scr_window_list_selector_init(3);