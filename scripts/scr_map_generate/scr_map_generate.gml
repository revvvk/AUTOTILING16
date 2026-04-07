///@description seleciona qual mapa vai ser gerado
function scr_map_generate(_map_type){
    //script que cria o array lógico do mapa
    map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    
    //verifica qual tipo de mapa requerido
    //se for o mapa estruturado, chama o drunken walk dele
    if(_map_type == "structured"){
        map_dungeon = scr_map_drunken_walk_structured_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    }
    
    //se for o mapa organico, chama o script que percorre o array e gera ele
    else if(_map_type == "organic"){
        map_dungeon = scr_map_drunken_walk_organic_dungeon(map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    }
    
    //chamando o script que aplica variações nas sprites
    map_random_tiles = scr_map_tile_variation(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando script que faz o autotile
    scr_map_autotile(map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando o script que aplica as sombras
    scr_map_shadows(map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    //spawn do player ao clicar para criar o mapa
    scr_player_spawn(MAP_WIDTH, MAP_HEIGHT);
}