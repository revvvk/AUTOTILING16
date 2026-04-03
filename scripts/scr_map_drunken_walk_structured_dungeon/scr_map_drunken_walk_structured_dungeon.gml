///@description Algoritmo usado para a movimentação do bêbado pelo mapa
///@param {array} _map Array 2D onde o bebâdo vai caminhar
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
///@param {real} _percentage Porcentagem da quantidade de chão que o mapa deve conter
///@returns {array} Retorna o mapa com o caminho que o bêbado fez
function scr_map_drunken_walk_structured_dungeon(_map, _map_width, _map_height, _percentage){
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
    var _brush_size = 3
    
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
    
    //direção sorteada
    var _direction = irandom(3);
    
    //guarda a última direção sorteada
    var _last_dir = -1;
    
    //passos para virar ou criar sala
    var _steps = irandom_range(30, 35);
    
    //quantos passos até virar para outra direção ou criar uma sala
    var _steps_until_turn = _steps;
    
    //chance de criar sala
    var _room_chance = 30;
    
    
    //enquanto não cumprir a meta de tiles de chão, continua o loop escavando
    while(_tiles_floor_created < _tiles_floor_percentage){
        //chama o script que cava corredores
        _tiles_floor_created += scr_map_dig_area(_map, _walker_x, _walker_y, _brush_size, _map_border, _map_width, _map_height);
        
        
        //aplicando o deslocamento na direção sorteada nos eixos x e y do bêbado
        _walker_x += _walker_dir_x[_direction];
        _walker_y += _walker_dir_y[_direction];
        
        
        //limitando o bêbado dentro das margens das bordas do mapa
        _walker_x = clamp(_walker_x, _map_border, _map_width - _map_border - 1);
        _walker_y = clamp(_walker_y, _map_border, _map_height - _map_border - 1);
        
        //diminuo a quantidade de passos para virar ou criar sala
        _steps_until_turn--;
        
        
        //se os passos chegarem em 0, muda de direção ou cria sala
        if(_steps_until_turn <= 0){
            //cria sala se a chance ocorrer
            if(irandom(100) < _room_chance){
                //define o tamanho da sala a ser criada 
                var _room_size = irandom_range(12, 15);
                //chama o script que cava corredores mas agora passando o tamanho da sala para ele escavar
                _tiles_floor_created += scr_map_dig_area(_map, _walker_x, _walker_y, _room_size, _map_border, _map_width, _map_height);
            }
            
            if(_direction == 0){
                _last_dir = 1;
            }
            else if(_direction == 1){
                _last_dir = 0;
            }
            else if(_direction == 2){
                _last_dir = 3;
            }
            else if(_direction == 3){
                _last_dir = 2;
            }
            
            //sorteia uma nova direção
            var _new_direction = irandom(3);
            
            //segurança para não travar quando não tem direção para sortear
            var _seg = 0;
            
            //continua sorteando se essa nova direção for igual a antiga e a segurança for menor que 10
            while((_new_direction == _last_dir || _new_direction == _direction) && _seg < 10) {
                _new_direction = irandom(3);
                _seg++;
            }
            
            _direction = _new_direction;
            _steps_until_turn = _steps;
        }
    }
    //retorna o mapa gerado
    return _map; 
}