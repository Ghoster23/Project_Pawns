if(scr_unique_inst()) {exit;}
ds_depthgrid = 0;
ds_depthgrid = ds_grid_create(2,1);

camera = room_get_camera(room,0);
cam_wd = camera_get_view_width(camera);
cam_hg = camera_get_view_height(camera);