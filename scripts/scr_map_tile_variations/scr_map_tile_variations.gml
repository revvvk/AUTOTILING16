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
    
    //esse é o array com as variações de tiles da borda de baixo da parede
    var _var_bot_mid_wall = array_create(_map_width);
    for(var _i = 0; _i < _map_width; _i++){
        _var_bot_mid_wall[_i] = array_create(_map_height, 0);
    }
    
    //esse é o array com as variações da parede lateral esquerda
    var _var_left_wall = array_create(_map_width);
    for(var _i = 0; _i < _map_width; _i++){
        _var_left_wall[_i] = array_create(_map_height, 0);
    }
    
    //esse é o array com as variações da parede lateral direita
    var _var_right_wall = array_create(_map_width);
    for(var _i = 0; _i < _map_width; _i++){
        _var_right_wall[_i] = array_create(_map_height);
    }
    
    
    //guarda os dois arrays dentro de um array principal que vai conter todos os outros arrays de variações de tiles
    //foram usadas as macros para melhor identificação do que é cada posição
    _tile_variations[VAR_WALL_FACE] = _var_wall_face;
    _tile_variations[VAR_TOP_MID_WALL] = _var_top_mid_wall;
    _tile_variations[VAR_BOT_MID_WALL] = _var_bot_mid_wall;
    _tile_variations[VAR_LEFT_WALL] = _var_left_wall;
    _tile_variations[VAR_RIGHT_WALL] = _var_right_wall;
    
    
    //criando um array com todas as possibilidades de variação do tile de face da parede
    //adicionando todos os índices disponíveis no tileset
    //a posição 0 é a padrão
    var _wall_face_variations       =   [WALL_FACE, WALL_FACE_VAR1, WALL_FACE_VAR2, 
                                        WALL_FACE_VAR3, WALL_FACE_VAR4, WALL_FACE_VAR5, 
                                        WALL_FACE_VAR6, WALL_FACE_VAR7, WALL_FACE_VAR8, 
                                        WALL_FACE_VAR9];
    //pesos para o sorteio
    var _wall_face_weights          = [40, 30, 20, 20, 5, 20, 20, 10, 20, 5];
    
    //array com as variações de tiles para o topo da parede
    //contendo os indices do tileset declarados por macros
    var _top_mid_wall_variations    =   [TOP_MID_WALL, TOP_MID_WALL_VAR1, TOP_MID_WALL_VAR2, 
                                        TOP_MID_WALL_VAR3, TOP_MID_WALL_VAR4, TOP_MID_WALL_VAR5,
                                        TOP_MID_WALL_VAR6, TOP_MID_WALL_VAR7, TOP_MID_WALL_VAR8,
                                        TOP_MID_WALL_VAR9];
    
    var _bot_mid_wall_variations    =   [BOT_MID_WALL, BOT_MID_WALL_VAR1, BOT_MID_WALL_VAR2, 
                                        BOT_MID_WALL_VAR3, BOT_MID_WALL_VAR4, BOT_MID_WALL_VAR5,
                                        BOT_MID_WALL_VAR6];
    
    var _left_wall_variations       =   [LEFT_WALL, LEFT_WALL_VAR1, LEFT_WALL_VAR2, 
                                        LEFT_WALL_VAR3, LEFT_WALL_VAR4, LEFT_WALL_VAR5];
    var _left_wall_weights          = [60, 30, 10, 10, 5, 5];
    
    
    var _right_wall_variations      =   [RIGHT_WALL, RIGHT_WALL_VAR1, RIGHT_WALL_VAR2,
                                        RIGHT_WALL_VAR3, RIGHT_WALL_VAR4, RIGHT_WALL_VAR5];
    var _right_wall_weights         = [60, 30, 10, 10, 5, 5];
    
    
    //função que sorteia as variações de tiles com pesos
    function choose_weighted(_tiles, _weights){
        var _count = array_length(_tiles);
        var _total_weight = 0;
        
        for(var _i = 0; _i < _count; _i++){
            _total_weight += _weights[_i];
        }
        
        var _roll = random(_total_weight);
        var _acc = 0;
        
        for(var _i = 0; _i <_count; _i++){
            _acc += _weights[_i];
            
            if(_roll < _acc){
                return _tiles[_i];
            }
        }
        
        //retorno de segurança caso nenhum if seja satisfeito
        //retorna um tile válido
        return _tiles[_count - 1];
    }
    
    
    //percorrendo os arrays 2D criados
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            //verificando se a célula atual é parede
            if(_map[_i][_j] == TILE_WALL){
                
                ////sorteando um indice entre 0 e o último elemento do array com as variações
                //var _random_wall_face = irandom(array_length(_wall_face_variations) - 1);
                ////usa o sorteio para pegar o índice real do tileset
                //_tile_variations[VAR_WALL_FACE][_i][_j] = _wall_face_variations[_random_wall_face];
                
                //usando o sorteio com pesos para definir as variações das faces de parede
                _tile_variations[VAR_WALL_FACE][_i][_j] = choose_weighted(_wall_face_variations, _wall_face_weights);
                
                //---
                
                //sorteio do indice do topo da parede
                var _random_top_mid_wall = irandom(array_length(_top_mid_wall_variations) - 1);
                //guardando o indice sorteado na posição da célula (i,j) dentro do vetor que está na posição 2
                //do vetor container principal
                _tile_variations[VAR_TOP_MID_WALL][_i][_j] = _top_mid_wall_variations[_random_top_mid_wall];
                
                //---
                
                //sorteio do indice do tile da borda de baixo
                var _random_bot_mid_wall = irandom(array_length(_bot_mid_wall_variations) - 1);
                //guardando o indice sorteado
                _tile_variations[VAR_BOT_MID_WALL][_i][_j] = _bot_mid_wall_variations[_random_bot_mid_wall];
                
                //---
                
                ////sorteio do indice do tile da parede esquerda
                //var _random_left_wall = irandom(array_length(_left_wall_variations) - 1);
                //_tile_variations[VAR_LEFT_WALL][_i][_j] = _left_wall_variations[_random_left_wall];
                
                //usando o sorteio com pesos para definir as variações das paredes da lateral esquerda
                _tile_variations[VAR_LEFT_WALL][_i][_j] = choose_weighted(_left_wall_variations, _left_wall_weights);
                
                ////---
                
                ////sorteio do indice do tile da parede direita
                //var _random_right_wall = irandom(array_length(_right_wall_variations) - 1);
                //_tile_variations[VAR_RIGHT_WALL][_i][_j] = _right_wall_variations[_random_right_wall];
                
                //usando o sorteio com pesos para definir as variações das paredes da lateral direita
                _tile_variations[VAR_RIGHT_WALL][_i][_j] = choose_weighted(_right_wall_variations, _right_wall_weights);
            }
        }
    }
    
    //retorna o array com as variações dos tiles para quem o chamou
    return _tile_variations;
}