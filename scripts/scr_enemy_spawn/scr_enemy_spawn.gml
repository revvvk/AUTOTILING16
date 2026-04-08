function scr_enemy_spawn(_map, _map_width, _map_height){
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //checa se o tile é chão para poder criar um inimigo sobre ele com uma chance
            if(_map[_i][_j] == TILE_FLOOR){
                //chance do spawn de inimigo
                var _spawn_chance = 0.5;
                
                //se a chance acontecer, spawna um inimigo na célula de chão
                if(irandom(100) < _spawn_chance){
                    //conversão da célula em pixel
                    var _spawn_enemy_x = (_i * TILE_SIZE) + (TILE_SIZE / 2);
                    var _spawn_enemy_y = (_j * TILE_SIZE) + (TILE_SIZE / 2);
                    
                    //criando uma instancia na layer INSTANCES para teste
                    instance_create_layer(_spawn_enemy_x, _spawn_enemy_y, "Instances", obj_enemy);
                }
            }
            
        }
    }
}