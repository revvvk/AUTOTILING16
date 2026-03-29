///@description Script que percorre e cava o mapa no tamanho definido e retorna os tiles de chão escavados
///@param {array} _map Mapa a ser escavado
///@param {real} _walker_x Posição x do bebado
///@param {real} _walker_y Posição y do bebado
///@param {real} _size Tamanho do caminho ou sala que o bebado vai escavar
///@param {real} _map_border Tamanho da borda do mapa
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
///@returns {real} Retorna a quantidade de chão criado
function scr_map_dig_area(_map, _walker_x, _walker_y, _size, _map_border, _map_width, _map_height){
    var _floor_created = 0;
    var _size_offset = _size div 2;
    
    //percorre o mapa e marca o chão escavado
    for(var _i = 0; _i < _size; _i++){
        for(var _j = 0; _j < _size; _j++){
            var _tile_x = _walker_x + _i - _size_offset;
            var _tile_y = _walker_y + _j - _size_offset;
            
            //verificação dos limites do mapa e sua borda
            if(_tile_x >= _map_border && _tile_x < _map_width - _map_border &&
                _tile_y >= _map_border && _tile_y < _map_height - _map_border){
                
                //verifica se o tile é diferente de chão
                if(_map[_tile_x][_tile_y] != TILE_FLOOR){
                    _map[_tile_x][_tile_y] = TILE_FLOOR;
                    
                    _floor_created++;
                }
            }
        }
    }
    
    return _floor_created;
}