///@description Algoritmo usado para a movimentação do bêbado pelo mapa
///@param {array} _map Array 2D onde o bebâdo vai caminhar
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
///@param {real} _percentage Porcentagem da quantidade de chão que o mapa deve conter
///@returns {array} Retorna o mapa com o caminho que o bêbado fez
function scr_map_drunken_walk_organic_dungeon(_map, _map_width, _map_height, _percentage){
    //cálculo da meta de tiles de chão a serem criados utilizando a porcentagem
    var _tiles_floor_percentage = floor(_map_width * _map_height * _percentage);
    
    //tamanho da borda em tiles que o mapa vai reservar para a borda em todos os lados
    var _map_border = 10;
    
    //posição onde o bêbado vai começar (meio do mapa)
    var _walker_x = _map_width div 2;
    var _walker_y = _map_height div 2;
    
    //contador do número de tiles de chão criados
    var _tiles_floor_created = 1;
    
    //tamanho dos passos do bebado
    var _brush_size = 3;
    
    //marcando a posição inicial do bêbado como chão
    _map[_walker_x][_walker_y] = TILE_FLOOR;
    
    //verificando se a porcentagem da meta de tiles de chão é inválida
    var _max_percentage = (MAP_WIDTH - _map_border * 2) * (MAP_HEIGHT - _map_border * 2) / (_map_width * _map_height);
    //se a porcentagem requeria para criar o mapa for maior que o número de tiles de chão possíveis, mostra o erro
    if(_percentage > _max_percentage){
        show_debug_message("ERRO: META DE TILES IMPOSSÍVEL DE ALCANÇAR!" + 
                            "\nVALOR REQUERIDO: " + string(_percentage) +
                            "\nVALOR MÁXIMO: " + string(_max_percentage));
        return _map;
    }
    
    //direções que podem ser sorteadas para o bêbado
    //1 e 0     = direita
    //-1 e 0    = esquerda
    //0 e 1     = baixo
    //0 e -1    = cima
    var _walker_dir_x = [1, -1,  0,  0];
    var _walker_dir_y = [0,  0,  1, -1];
    
    //enquanto não atingir a meta de tiles de chão criados, continua o loop percorrendo o mapa
    while(_tiles_floor_created < _tiles_floor_percentage) {
        
        var _direction = irandom(3);
         
        //aplicando o deslocamento na direção sorteada nos eixos x e y do bêbado
        _walker_x += _walker_dir_x[_direction];
        _walker_y += _walker_dir_y[_direction];
        
        
        //limitando o bêbado dentro das margens das bordas do mapa
        _walker_x = clamp(_walker_x, _map_border, _map_width - _map_border - 1);
        _walker_y = clamp(_walker_y, _map_border, _map_height - _map_border - 1);
        
        //contando os tiles ao chamar o script que faz a escavação e marca o chão
        _tiles_floor_created += scr_map_dig_area(_map, _walker_x, _walker_y, _brush_size, _map_border, _map_width, _map_height);
    }
    
    //retorna o mapa criado
    return _map;
}