switch(room){	
	default:
		draw_sprite_ext(spr_cursor, 0, gui_x, gui_y,
						global.gui_ratio, global.gui_ratio,
						0, c_white, 1);
		
		draw_text(gui_x, gui_y + 16, string(gui_x));
		draw_text(gui_x, gui_y + 32, string(gui_y));
	break;
}