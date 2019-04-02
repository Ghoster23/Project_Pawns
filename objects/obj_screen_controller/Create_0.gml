application_surface_draw_enable(false);
if(scr_unique_inst()) {exit;}

alarm[0] = 5;

surface_wd = 0;
surface_hg = 0;

global.fullscreen = window_get_fullscreen();

#region Init
//Monitor
global.Monitor_wd = display_get_width();  //Monitor width
global.Monitor_hg = display_get_height(); //Monitor height

global.Monitor_asr = global.Monitor_wd / global.Monitor_hg; //Monitor aspect ratio

//Camera
global.cam_wd  = 1792; //Default camera width
global.cam_hg  = 1024; //Default camera heigth

global.cam_asr = global.cam_wd/global.cam_hg; //Default camera aspect ratio
global.cam_cvr = 1;                           //Default camera conversion ratio
#endregion

#region Calculations
if(global.cam_asr < global.Monitor_wd/global.Monitor_hg){
	global.cam_cvr = global.Monitor_hg div global.cam_hg;
	
	global.cam_hg  = global.Monitor_hg div global.cam_cvr;
	global.cam_wd  = global.cam_hg      *  global.Monitor_asr;
			
}else {
	global.cam_cvr = global.Monitor_wd div global.cam_wd;
	
	global.cam_wd  = global.Monitor_wd div global.cam_cvr;
	global.cam_hg  = global.cam_wd      /  global.Monitor_asr;
}

global.cam_asr = global.cam_wd / global.cam_hg;
#endregion

#region Adjustments
game_rooms = [room0];

for(var i = 0; i < 1; i++){
	var cam = room_get_camera(game_rooms[i],0); //Gte room's camera
		
	camera_set_view_size(cam, global.cam_wd, global.cam_hg);           //Change view size
	camera_set_view_border(cam, global.cam_wd / 2, global.cam_hg / 2); //Change view border
	
	room_set_viewport(game_rooms[i], 0, true, 0, 0, global.cam_wd, global.cam_hg); //Set viewport
}

scr_screen_res();
#endregion