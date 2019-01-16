var cl = global.cell_size;

#region Lines
draw_set_color(c_blue);
for(var i = 1; i < h_cells; i++){
	var xx = i * cl;
	draw_line( xx, 0, xx, room_height);
}

for(var j = 1; j < v_cells; j++){
	var yy = j * cl;
	draw_line( 0, yy, room_width, yy);
}
draw_set_color(c_white);
#endregion