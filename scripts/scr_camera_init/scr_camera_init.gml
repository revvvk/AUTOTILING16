function scr_camera_init(){
    cam = view_camera[0];
    
    cam_w = 1280;
    cam_h = 720;
    
    cam_x = (room_width - cam_w) / 2;
    cam_y = (room_height - cam_h) / 2;
    
    is_dragging = false;
    drag_x = 0;
    drag_y = 0;
    
    zoom_speed = 0.08;
    zoom_min_w = 320;
    zoom_min_h = 180;
    zoom_max_w = 10000;
    zoom_max_h = 10000;
    
    camera_set_view_size(cam, cam_w, cam_h);
    camera_set_view_pos(cam, cam_x, cam_y);
}