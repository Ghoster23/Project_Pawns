event_inherited();

sub_type = pawn_type.player;

image_blend = c_fuchsia;

offset = true;

draw_script = scr_draw_pawn;

max_hp = 5;
hp     = 5;

scr_statuses_init();

#region Action
act  = 0; //[0 - Can't act | 1 - Act done | 2 - Can act]

act_list = ds_list_create();

act_stt =  0;
act_cur = -1;
#endregion

#region Movement
move  = 0;     //[0 - Can't move | 1 - Move done | 2 - Can move]
moved = false; //Did move

moveable = false; //Can be moved by the player

mov_hor = 0;
mov_ver = 0;

mov_list = -1;    //Places to which it can move
mov_path = -1;    //Path to target
mov_nxt  = noone; //Tile to move to next
mov_trg  = noone; //Tile target
mov_stt  = 0;     //Movement state

mov_listen = true;
#endregion