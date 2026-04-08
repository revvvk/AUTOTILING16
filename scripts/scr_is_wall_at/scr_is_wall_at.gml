function is_wall_at(_pixel_x, _pixel_y){
    //transforma a posição do pixel em linhas e colunas
    var _col = floor(_pixel_x / TILE_SIZE);
    var _row = floor(_pixel_y / TILE_SIZE);
    
    //checagem dos limites do mapa
    if(_col < 0 || _row < 0 || _col >= MAP_WIDTH || _row >= MAP_HEIGHT){
        return true;
    }
    
    //retorna as células que são parede
    return global.map_dungeon[_col][_row] == 0;
}
