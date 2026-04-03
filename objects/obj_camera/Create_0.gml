/// @description Insert description here
// You can write your code in this editor
//scr_camera_init();

//pegando a camera atual
cam = view_camera[0];

//tamanho do mapa em pixels
map_width = MAP_WIDTH * TILE_SIZE;
map_height = MAP_HEIGHT * TILE_SIZE;

//tamanho da janela da view
view_base_w = 1280;
view_base_h = 720;

aspect = view_base_w / view_base_h;

//calcula o quanto a camera precisa estar afastada para caber o mapa inteiro
var _scale_x = map_width / view_base_w;
var _scale_y = map_height / view_base_h;

//usa a maior escala no zoom para garantir que tudo caiba
zoom = min(_scale_x, _scale_y);

//tamanho inicial da camera para enquadrar o mapa inteiro quando iniciar
cam_width = view_base_w * zoom;
cam_height = view_base_h * zoom;

//centralizando a camera no meio do mapa
cam_x = (map_width - cam_width) / 2;
cam_y = (map_height - cam_height) / 2;

//variaveis de controles do arrasto com o mouse
is_dragging = false;
drag_x = 0;
drag_y = 0;

//configurações do zoom
zoom_step = 0.1;
min_cam_width = 320;
min_cam_height = 180;

//máximo tamanho da camera que garante que o mapa inteiro possa aparecer
max_cam_width = map_width;
max_cam_height = map_height;

//aplicando o tamanho e a posição inicial da camera
camera_set_view_size(cam, cam_width, cam_height);
camera_set_view_pos(cam, cam_x, cam_y);