if(scr_unique_inst()) {exit;}

image_xscale = 3;
image_yscale = 3;

width  = view_wport[0];
height = view_hport[0];

orig_wd = width;
orig_hg = height;

#region Movement
movement_rate = 0.25;

target = instance_nearest(0,0,obj_player);

if(target != noone and instance_exists(target)){
	x = target.x + 32;
	y = target.y + 32;
}else {
	x = room_width  / 2;
	y = room_height / 2;
	target = noone;
}
#endregion

//Position
shake_x = x;
shake_y = y;

target_x = x;
target_y = y;

#region Zoom
can_zoom = false;

zoom = 1;

zoom_rate = 0.3;
zoom_tolr = 0.01;

target_zoom = 1;

min_zoom = 0.25;
max_zoom = 4;
#endregion

//Shake
screen_shake = 0;

//States
move_state = 0;