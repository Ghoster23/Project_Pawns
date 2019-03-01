{
//On the ground
if(z != 0){
	draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Off the ground
}else {
	draw_self();
}
}