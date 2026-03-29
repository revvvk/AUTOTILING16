///@description Desenha os tiles no mapa
///@param {array} _map Array 2D do mapa
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
function scr_map_autotile16floor(_map, _map_width, _map_height){
    //pegando o id dos tilemaps de chão e parede
    var _tilemap_floor = layer_tilemap_get_id("tls_floor");
    var _tilemap_walls = layer_tilemap_get_id("tls_walls");
    
    //limpando os tilemaps para os desenhos não se sobrescreverem
    tilemap_clear(_tilemap_floor, 0);
    tilemap_clear(_tilemap_walls, 0);
    
    
    //percorrendo pelo mapa para verificar as células que são chão
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //tilemap_set(_tilemap_walls, 1, _i, _j);
            
            //se a célula for chão, coloca o tile de chão
            if(_map[_i][_j] == TILE_FLOOR){
                //coloca o tile de chão
                tilemap_set(_tilemap_floor, 15, _i, _j);
                
                //calculando os vizinhos para criar o bitmask
                var _north  = (_j - 1 >= 0 && _map[_i][_j - 1] == TILE_FLOOR);
                var _east   = (_i + 1 < _map_width && _map[_i + 1][_j] == TILE_FLOOR);
                var _south  = (_j + 1 < _map_height && _map[_i][_j + 1] == TILE_FLOOR);
                var _west   = (_i - 1 >= 0 && _map[_i - 1][_j] == TILE_FLOOR);
                
                //cálculo do bitmask baseado nos vizinhos de chão
                var _bitmask = (_north * 1) + (_east * 2) + (_south * 4) + (_west * 8);
                
                //desenhando a moldura de paredes na camada de paredes
                tilemap_set(_tilemap_walls, _bitmask, _i, _j);
                
                draw_text(_i * 16, _j * 16, string(_bitmask));
            }
        }
    }
}