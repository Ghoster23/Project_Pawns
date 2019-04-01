#region Direction
if(mov_listen > 0){
	mov_hor = global.key_active[key_id.left] - global.key_active[key_id.right];
	mov_ver = global.key_active[key_id.down] - global.key_active[key_id.up];
	
	mov_listen--;
}

if(mov_hor != 0 or mov_ver != 0){
	if(mov_trg == noone and mov_listen == 0){
		var xx = x div global.cell_size + mov_hor;
		var yy = y div global.cell_size + mov_ver;
		
		var fr = scr_brd_tile_is_free( xx, yy);
	
		if(fr){
			if((mov_hor != 0 and mov_ver != 0 and 
				(scr_brd_tile_is_free(xx-mov_hor,yy) or scr_brd_tile_is_free(xx,yy-mov_ver))) or 
				(mov_hor != 0 xor mov_ver != 0)){
				mov_nxt = global.dg_tile[# xx, yy];
				mov_trg = mov_nxt;
			}
		}
		
		mov_hor = 0;
		mov_ver = 0;
	}
}else {
	mov_listen = 3;
}
#endregion