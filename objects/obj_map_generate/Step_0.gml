/// @description Insert description here
// You can write your code in this editor


//if(keyboard_check_released(ord("R"))){
    ////iniciando o script que cria os arrays do mapa
    //map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    //
    //
    ////chamando o script do bêbado para percorrer os arrays do mapa
    ////mapa de dungeon mais orgânico
    ////map_dungeon = scr_map_drunken_walk_organic_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    //
    //
    ////mapa de dungeon mais estruturado
    //map_dungeon = scr_map_drunken_walk_structured_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    //
    //
    ////chamando o script que sorteia variações para os tiles
    //map_random_tiles = scr_map_tile_variation(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    //
    //
    ////chamando o script que coloca os tiles nos lugares corretos
    //scr_map_autotile(map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);
    //
    //
    ////aplicando as sombras projetadas das paredes corretamente
    //scr_map_shadows(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
//}

//botão na tela para mudar de mapa
//pegando a posição do mouse na gui
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

//detectando se o mouse está sobre o retangulo do botão structured
hover_structured = point_in_rectangle( _mx, _my,
                            gui_x - button_width / 2, gui_y - button_height / 2,
                            gui_x + button_width / 2, gui_y + button_height / 2);

//checando se o mouse está sobre o botão e clicou
if(hover_structured && mouse_check_button_pressed(mb_left)){
    //iniciando o script que cria os arrays do mapa
    map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    
    //mapa de dungeon mais estruturado
    map_dungeon = scr_map_drunken_walk_structured_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    
    
    //chamando o script que sorteia variações para os tiles
    map_random_tiles = scr_map_tile_variation(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    
    //chamando o script que coloca os tiles nos lugares corretos
    scr_map_autotile(map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);
    
    
    //aplicando as sombras projetadas das paredes corretamente
    scr_map_shadows(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
}

//detectando se o mouse está sobre o botão organic
hover_organic = point_in_rectangle(_mx, _my,
                                    gui_x2 - button_width / 2, gui_y2 - button_height / 2,
                                    gui_x2 + button_width / 2, gui_y2 + button_height / 2);

if(hover_organic && mouse_check_button_pressed(mb_left)){
    //iniciando o script que cria os arrays do mapa lógico
    map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    
    //iniciando o script que gera um mapa organico
    map_dungeon = scr_map_drunken_walk_organic_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    
    //chamando o script que sorteia variações para os tiles do mapa
    map_random_tiles = scr_map_tile_variation(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando o script que coloca os tiles nos lugares corretos
    scr_map_autotile(map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando o script que aplica as sombras projetadas das paredes
    scr_map_shadows(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
}

