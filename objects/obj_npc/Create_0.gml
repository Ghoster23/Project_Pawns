event_inherited();

sub_type = pawn_type.npc;

#region States
selected = false;

var out = scr_search_flood(global.dg_tile[# x div global.cell_size, y div global.cell_size], false, 1, 1, 0);
mov_list = out[0];
mov_path = out[1];
#endregion