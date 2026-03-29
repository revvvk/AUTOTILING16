///@description Algoritmo usado para a movimentação do bêbado pelo mapa
///@param {array} _map Array 2D onde o bebâdo vai caminhar
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
///@param {real} _percentage Porcentagem da quantidade de chão que o mapa deve conter
///@returns {array} Retorna o mapa com o caminho que o bêbado fez
function scr_map_drunken_walk(_map, _map_width, _map_height, _percentage){
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
    
    //tamanho dos passos
    var _steps = irandom_range(14, 16);
    
    //passos até escolher uma nova direção
    var _steps_new_dir = _steps;
    
    //chance de sala 10%
    var _room_chance = 20;
    
    //sorteando uma direção x e y para o bêbado
    var _direction = irandom(3);
    
    //guarda a última direção sorteada
    var _last_dir = -1;
    
    //o bêbado anda enquanto os tiles de chão criados não atingirem a meta
    while(_tiles_floor_created < _tiles_floor_percentage){
        
        //se os passos chegarem em 0, escolhe uma nova direção
        if(_steps_new_dir <= 0){ 
             
            //chance de 10% de criar uma sala com o tamanho de 4~6x4~6
            if(irandom(100) < _room_chance){
                //tamanho da sala que será criada caso a chance ocorra
                var _room_size = irandom_range(10, 12);
                
                for(var _i = 0; _i < _room_size; _i++){
                    for(var _j = 0; _j < _room_size; _j++){
                        var _new_room_x = _walker_x + _i - floor(_room_size / 2);
                        var _new_room_y = _walker_y + _j - floor(_room_size / 2);
                        
                        //checa se o novo passo esta dentro dos limites do mapa e suas bordas
                         if(_new_room_x >= _map_border && _new_room_x < _map_width - _map_border && 
                             _new_room_y >= _map_border && _new_room_y < _map_height - _map_border){
                             //se o tile atual do passo for diferente de chão
                             if(_map[_new_room_x][_new_room_y] != TILE_FLOOR){
                                 //transforma em chão
                                 _map[_new_room_x][_new_room_y] = TILE_FLOOR;
                                 //conta o tile
                                 _tiles_floor_created++; 
                            }
                        }
                    }
                }
            }
            
            //definindo a direção contrária para o bebado não voltar por ela
            //se for para a direita, veio da esquerda
            if(_direction == 0){
                _last_dir = 1;
            }
            //se for para a esquerda, veio da direita
            else if(_direction == 1){
                _last_dir = 0;
            }
            //se for para baixo, veio de cima
            else if(_direction == 2){
                _last_dir = 3;
            }
            //se for para cima, veio de baixo
            else if(_direction == 3){
                _last_dir = 2;
            }
            
            //sorteia uma nova direção
            var _new_dir = irandom(3);
            //enquanto a nova direção for igual a última direção, sorteia de novo
            while(_new_dir == _last_dir){
                //novo sorteio
                _new_dir = irandom(3);
            }
            
            //define a nova direção como a direção
            _direction = _new_dir;
            
            //reseta o valor dos passos para criar uma nova sala
            _steps_new_dir = _steps;
        }
        
        //sorteando uma direção x e y para o bêbado
        //var _direction = irandom(3);
        
        //aplicando o deslocamento na direção sorteada nos eixos x e y do bêbado
        _walker_x += _walker_dir_x[_direction];
        _walker_y += _walker_dir_y[_direction];
        
        
        //limitando o bêbado dentro das margens das bordas do mapa
        _walker_x = clamp(_walker_x, _map_border, _map_width - _map_border - 1);
        _walker_y = clamp(_walker_y, _map_border, _map_height - _map_border - 1);
        
        
        //BEBADO PADRÃO QUE ANDA DE 1 EM 1
        ////transformando as células do array do mapa visitadas pelo bêbado em chão
        ////se a célula visitada for diferente de chão
        //if(_map[_walker_start_x][_walker_start_y] != TILE_FLOOR){
            ////transforma a célula visitada em chão
            //_map[_walker_start_x][_walker_start_y] = TILE_FLOOR;
            //
            ////conta 1 tile criado
            //_tiles_floor_created++;
        //}
        
        
        
        //passos flexíveis
        //transformando as células do array do mapa visitadas pelos passos do bebado com o tamanho definido pelo _brush_size
        for(var _i = 0; _i < _brush_size; _i++){
            for(var _j = 0; _j < _brush_size; _j++){
                //adiciona o novo tamanho do passo centralizando o bebado
                var _new_step_x = _walker_x + _i - floor(_brush_size / 2);
                var _new_step_y = _walker_y + _j - floor(_brush_size / 2);
                
                //checa se o novo passo esta dentro dos limites do mapa e suas bordas
                if(_new_step_x >= _map_border && _new_step_x < _map_width - _map_border && 
                    _new_step_y >= _map_border && _new_step_y < _map_height - _map_border){
                    //se o tile atual do passo for diferente de chão
                    if(_map[_new_step_x][_new_step_y] != TILE_FLOOR){
                        //transforma em chão
                        _map[_new_step_x][_new_step_y] = TILE_FLOOR;
                        //conta o tile
                        _tiles_floor_created++;
                    }
                }
            }
        }
        
        //contagem de passos para escolher uma nova direção
        _steps_new_dir--;
    }
    
    //retorna o mapa com o caminho percorrido
    return _map;
}