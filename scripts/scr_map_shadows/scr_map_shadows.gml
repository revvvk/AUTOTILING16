///@description Desenha as sombras projetadas pelas paredes no chão
///@param {array} _map        Array 2D lógico do mapa
///@param {real}  _map_width  Largura do mapa em tiles
///@param {real}  _map_height Altura do mapa em tiles
function scr_map_shadows(_map, _map_width, _map_height){
    //pegando o id da camada de sombras
    var _tilemap_shadows = layer_tilemap_get_id("tls_shadows");
    
    //sombras projetadas das paredes
    tilemap_set_width(_tilemap_shadows, _map_width);
    tilemap_set_height(_tilemap_shadows, _map_height);
    
    //limpando a camada antes de desenhar para não sobrescrever nada
    tilemap_clear(_tilemap_shadows, 0);
    
    //percorre o array do mapa célula por célula
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            //só verifica as células de chão para receber as sombras
            if(_map[_i][_j] == TILE_FLOOR){
                //verifica se tem parede acima da célula de chão
                var _north = (_j > 0) && (_map[_i][_j - 1] == TILE_WALL);
                
                //verifica se tem parede à direita da célula de chão
                var _east = (_i < _map_width - 1) && (_map[_i + 1][_j] == TILE_WALL);
                
                //verifica se tem parede somente na diagonal superior direita
                var _northeast_inner_corner = (_i < _map_width - 1) && (_j > 0) && (_map[_i + 1][ _j - 1] == TILE_WALL);
                
                var _southeast_inner_corner = (_i < _map_width - 1) && (_j < _map_height - 1) && (_map[_i + 1][_j + 1] == TILE_WALL);
                
                //verificando se tem parede acima e à direita
                if(_north && _east){
                    tilemap_set(_tilemap_shadows, SHADOW_TOP_RIGHT_CORNER, _i, _j);
                }
                
                //só parede de cima
                else if(_north){
                    tilemap_set(_tilemap_shadows, SHADOW_WALL_FACE, _i, _j);
                }
                
                //só parede a direita
                else if(_east){
                    tilemap_set(_tilemap_shadows, SHADOW_RIGHT_WALL, _i, _j);
                }
                
                //parede só na diagonal direita (canto L)
                else if(_northeast_inner_corner){
                    tilemap_set(_tilemap_shadows, SHADOW_TOP_RIGHT_INNER_CORNER, _i, _j);
                }
                
                else if (_southeast_inner_corner){
                    tilemap_set(_tilemap_shadows, SHADOW_BOT_RIGHT_INNER_CORNER, _i, _j);
                }
            }
        }
    }
}