///@description Objeto que gerencia a chamada dos scripts para inicialização, refinamento e desenho do mapa

randomise();

//variáveis da câmera
drag_x = 0;
drag_y = 0;
is_dragging = false;

is_debugging = false;

//iniciando o script que cria os arrays do mapa
map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);


//chamando o script do bêbado para percorrer os arrays do mapa
//mapa de dungeon mais orgânico
map_dungeon = scr_map_drunken_walk_organic_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
//mapa de dungeon mais estruturado
//scr_map_drunken_walk_structured_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);


//chamando o script que sorteia variações para os tiles
map_random_tiles = scr_map_tile_variation(map_dungeon, MAP_WIDTH, MAP_HEIGHT);


//chamando o script que coloca os tiles nos lugares corretos
scr_map_autotile(map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);

