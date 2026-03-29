///@description Gera um array 2D com as variações visuais sorteadas de cada tile do mapa
///@param {array} _map Array 2D do mapa com tiles de parede e chão (TILE_WALLS E TILE_FLOOR)
///@param {real} _map_width Largura do mapa em tiles
///@param {real} _map_height Altura do mapa em tiles
///@returns {array} Retorna o array 2D do mapa com o índice da variação visual sorteada para cada célula de tile
function scr_map_tile_variation(_map, _map_width, _map_height){
    
    //cria o array de variações de tiles com a mesma largura do mapa lógico com paredes e chão
    var _tile_variations = array_create(_map_width);
    
    //percorre cada coluna do array criado e cria o array de linhas inicializado em 0
    for(var _i = 0; _i < _map_width; _i++){
        _tile_variations[_i] = array_create(_map_height, 0);
    }
    
    
    //criando um array com todas as possibilidades de variação do tile de face da parede
    //adicionando todos os índices disponíveis no tileset
    //a posição 0 é a padrão
    var _wall_face_variations = [WALL_FACE, WALL_FACE_VAR1, WALL_FACE_VAR2, WALL_FACE_VAR3, WALL_FACE_VAR4];
    
    
    //percorrendo os arrays 2D criados
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //verificando se a célula atual é parede
            if(_map[_i][_j] == TILE_WALL){
                
                //sorteando um indice entre 0 e o último elemento do array com as variações
                var _random_tile = irandom(array_length(_wall_face_variations) - 1);
                
                //usa o sorteio para pegar o índice real do tileset
                _tile_variations[_i][_j] = _wall_face_variations[_random_tile];
                
            }
        }
    }
    
    //retorna o array com as variações dos tiles para quem o chamou
    return _tile_variations;
    
    
    
    
    
}