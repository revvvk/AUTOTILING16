/// @description Insert description here
// You can write your code in this editor
//scr_camera_update();

//checa quando o botão esquerdo do mouse começa a ser pressionado para arrastar o mapa
if(mouse_check_button_pressed(mb_left)){
    is_dragging = true;
    
    //guardando a posição atual do mouse na gui como ponto inicial do arrasto
    drag_x = device_mouse_x_to_gui(0);
    drag_y = device_mouse_y_to_gui(0);
}

if(mouse_check_button_released(mb_left)){
    is_dragging = false;
}


if(is_dragging){
    //pegando a nova posição do mouse na gui
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);
    
    //calculando o quanto o mouse andou arrastando desde o último frame
    //e converte esse movimento da tela para a escala da camera
    var _diff_x = (_mx - drag_x) * (cam_width / window_get_width());
    var _diff_y = (_my - drag_y) * (cam_height / window_get_height());
    
    //movimenta a camera conforme o calculo de posições no sentido contrário ao movimento do mouse
    cam_x -= _diff_x;
    cam_y -= _diff_y;
    
    //atualiza o ponto de referencia
    drag_x = _mx;
    drag_y = _my;
}

//zoom da camera com a roda do mouse
var _wheel = mouse_wheel_down() - mouse_wheel_up();

if(_wheel != 0){
    //pegando a posição inicial para referencia
    var _old_width = cam_width;
    var _old_height = cam_height;
    
    //aplicando o zoom apenas na largura
    cam_width += cam_width * _wheel * zoom_step;
    //cam_height += cam_height * _wheel * zoom_step;
    
    //limitando o tamanho que o zoom pode ter
    cam_width = clamp(cam_width, min_cam_width, max_cam_width);
    //cam_height = clamp(cam_height, min_cam_height, max_cam_height);
    //recalcula a altura do zoom com uma proporção fixa
    cam_height = cam_width / aspect;
    
    //reposiciona para manter o centro da camera no mesmo lugar
    cam_x -= (cam_width - _old_width) / 2;
    cam_y -= (cam_height - _old_height) / 2;
}

//limitando a camera dentro do mapa
//se a camera estiver maior que o mapa, centraliza o mapa
//se não, limita normalmente
if(cam_width >= map_width){
    cam_x = (map_width - cam_width) / 2;
}

else{
    cam_x = clamp(cam_x, 0, map_width - cam_width);
}

if(cam_height >= map_height){
    cam_y = (map_height - cam_height) / 2;
}
else{
    cam_y = clamp(cam_y, 0, map_height - cam_height);
}

//aplicando a nova posição da camera
camera_set_view_size(cam, cam_width, cam_height);
camera_set_view_pos(cam, cam_x, cam_y);
