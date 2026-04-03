function scr_camera_update(){
// ARRASTAR
    if (mouse_check_button_pressed(mb_left)) {
        is_dragging = true;
        drag_x = device_mouse_x_to_gui(0);
        drag_y = device_mouse_y_to_gui(0);
    }
    
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
    
    if (is_dragging) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);
        
        var diff_x = (mx - drag_x) * (cam_w / window_get_width());
        var diff_y = (my - drag_y) * (cam_h / window_get_height());
        
        cam_x -= diff_x;
        cam_y -= diff_y;
        
        drag_x = mx;
        drag_y = my;
    }
    
    // ZOOM
    var wheel = mouse_wheel_down() - mouse_wheel_up();
    
    if (wheel != 0) {
        var old_w = cam_w;
        var old_h = cam_h;
        
        cam_w += cam_w * wheel * zoom_speed;
        cam_h += cam_h * wheel * zoom_speed;
        
        cam_w = clamp(cam_w, zoom_min_w, zoom_max_w);
        cam_h = clamp(cam_h, zoom_min_h, zoom_max_h);
        
        cam_x -= (cam_w - old_w) / 2;
        cam_y -= (cam_h - old_h) / 2;
    }
    
    camera_set_view_size(cam, cam_w, cam_h);
    camera_set_view_pos(cam, cam_x, cam_y);
}