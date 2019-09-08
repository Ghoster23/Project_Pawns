scr_unique_inst();

#region Board
global.cell_size = 64;

board_width  = 0;
board_depth  = 0;
board_height = 0;

x_cells = 0;
y_cells = 0;
z_cells = 0;

sl_cell = [-1, -1, -1];

global.dg_tile = -1;
global.dg_objs = -1;

global.brd_stt = 0;
#endregion

#region Turn
global.dl_pawns      = ds_list_create(); //List of pawns (pieces that have actions)
global.pawn_cnt      = 0;                //Pawn count
global.turn          = noone;            //Pawn who's has the turn
global.turn_counter  = 0;                //Turn counter (dah)
global.round_counter = 0;                //Round counter

slt_inst = noone;
slt_type = -1;
slt_stt  =  0;

mov_pawn = noone;
mov_list = -1;

act_pawn = noone;

run_state = 0;
#endregion