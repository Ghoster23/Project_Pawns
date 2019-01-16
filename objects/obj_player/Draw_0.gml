if(selected){
	draw_set_alpha(0.5);
	draw_set_color(c_green);
	
	var px = x div 64;
	var py = y div 64;
	
	for(var i = 0; i < 5; i++){
		for(var j = 0; j < 5; j++){
			var line = mov_grid[i];
			
			if(line[j] == 1){
				var xx = px + j - 2;
				var yy = py + i - 2;
				
				draw_rectangle(xx * 64, yy * 64, (xx + 1) * 64, (yy + 1) * 64, false);
			}
		}
	}
	draw_set_color(c_white);
	draw_set_alpha(1);
}

draw_self();