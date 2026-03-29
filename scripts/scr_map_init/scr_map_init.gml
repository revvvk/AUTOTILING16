///@description Cria um array 2D que contém as linhas e colunas do mapa
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
///@returns {array} Retorna o mapa criado
function scr_map_init(_map_width, _map_height){
    //cria o array da largura do mapa
    map = array_create(_map_width);
    
    //cria o array com a altura do mapa com base no número de colunas
    for(var _i = 0; _i < _map_width; _i++){
        //definindo todas as células do grid do mapa com parede
        map[_i] = array_create(_map_width, TILE_WALL);
    }
    
    //retorna o mapa criado
    return map;
}