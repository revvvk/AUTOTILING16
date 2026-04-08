///@description seleciona qual mapa vai ser gerado
function scr_map_generate(_map_type){
    //script que cria o array lógico do mapa
    global.map_dungeon = scr_map_init(MAP_WIDTH, MAP_HEIGHT);
    
    //verifica qual tipo de mapa requerido
    //se for o mapa estruturado, chama o drunken walk dele
    if(_map_type == "structured"){
        global.map_dungeon = scr_map_drunken_walk_structured_dungeon(global.map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    }
    
    //se for o mapa organico, chama o script que percorre o array e gera ele
    else if(_map_type == "organic"){
        global.map_dungeon = scr_map_drunken_walk_organic_dungeon(global.map_dungeon, MAP_WIDTH, MAP_HEIGHT, PERCENTAGE);
    }
    
    //chamando o script que aplica variações nas sprites
    map_random_tiles = scr_map_tile_variation(global.map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando script que faz o autotile
    scr_map_autotile(global.map_dungeon, map_random_tiles, MAP_WIDTH, MAP_HEIGHT);
    
    //chamando o script que aplica as sombras
    scr_map_shadows(global.map_dungeon, MAP_WIDTH, MAP_HEIGHT);
    
    
    //---
    //SPAWN DO PLAYER
    
    //spawn do player ao clicar para criar o mapa
    scr_player_spawn(MAP_WIDTH, MAP_HEIGHT);
    
    
    
    //---
    //SPAWN DE INIMIGOS
    
    //checa se existem instancias de inimigos e destrói elas
    if(instance_exists(obj_enemy)){
        instance_destroy(obj_enemy);
    }
    
    //spawn dos inimigos em tiles de chão
    scr_enemy_spawn(global.map_dungeon, MAP_WIDTH, MAP_HEIGHT);
}