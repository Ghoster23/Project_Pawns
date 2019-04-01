{
//Off the ground
if(z != 0){
	var ratio = 1-z/48;
	draw_sprite_ext(spr_shadow,0,x+32,y+32,ratio,ratio,0,c_white,ratio*0.7);
	draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//On the ground
}else {
	draw_self();
}
}