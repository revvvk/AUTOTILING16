///@description Gera um array 2D com as variações visuais sorteadas de cada tile do mapa
///@param {array} _map Array 2D do mapa com tiles de parede e chão (TILE_WALLS E TILE_FLOOR)
///@param {real} _map_width Largura do mapa em tiles
///@param {real} _map_height Altura do mapa em tiles
///@returns {array} Retorna o array 2D do mapa com o índice da variação visual sorteada para cada célula de tile
function scr_map_tile_variation(_map, _map_width, _map_height){
    
    //array que guarda todos os outros arrays de variações de tiles
    var _tile_variations = [];
    
    
    //cria o array de variações de tiles com a mesma largura do mapa lógico com paredes e chão
    //esse é o array com as variações de tiles da face da parede
    var _var_wall_face = array_create(_map_width);
    //percorre cada coluna do array criado e cria o array de linhas inicializado em 0
    for(var _i = 0; _i < _map_width; _i++){
        _var_wall_face[_i] = array_create(_map_height, 0);
    }
    
    //esse é o array com as variações de tiles do topo da parede
    var _var_top_mid_wall = array_create(_map_width);
    for(var _i = 0; _i < _map_width; _i++){
        _var_top_mid_wall[_i] = array_create(_map_height, 0);
    }
    
    
    //guarda os dois arrays dentro de um array principal que vai conter todos os outros arrays de variações de tiles
    //foram usadas as macros para melhor identificação do que é cada posição
    _tile_variations[VAR_WALL_FACE] = _var_wall_face;
    _tile_variations[VAR_TOP_MID_WALL] = _var_top_mid_wall;
    
    
    //criando um array com todas as possibilidades de variação do tile de face da parede
    //adicionando todos os índices disponíveis no tileset
    //a posição 0 é a padrão
    var _wall_face_variations = [WALL_FACE, WALL_FACE_VAR1, WALL_FACE_VAR2, 
                                WALL_FACE_VAR3, WALL_FACE_VAR4];
    
    //array com as variações de tiles para o topo da parede
    //contendo os indices do tileset declarados por macros
    var _top_mid_wall_variations = [TOP_MID_WALL, TOP_MID_WALL_VAR1, TOP_MID_WALL_VAR2, 
                                    TOP_MID_WALL_VAR3, TOP_MID_WALL_VAR4];
    
    
    //percorrendo os arrays 2D criados
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //verificando se a célula atual é parede
            if(_map[_i][_j] == TILE_WALL){
                
                //sorteando um indice entre 0 e o último elemento do array com as variações
                var _random_wall_face = irandom(array_length(_wall_face_variations) - 1);
                //usa o sorteio para pegar o índice real do tileset
                _tile_variations[VAR_WALL_FACE][_i][_j] = _wall_face_variations[_random_wall_face];
                
                //---
                
                //sorteio do indice do topo da parede
                var _random_top_mid_wall = irandom(array_length(_top_mid_wall_variations) - 1);
                //guardando o indice sorteado na posição da célula (i,j) dentro do vetor que está na posição 2
                //do vetor container principal
                _tile_variations[VAR_TOP_MID_WALL][_i][_j] = _top_mid_wall_variations[_random_top_mid_wall];
                
            }
        }
    }
    
    //retorna o array com as variações dos tiles para quem o chamou
    return _tile_variations;
    
    
    
    
    
}