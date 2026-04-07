///@description Faz o spawn do player no centro do mapa
function scr_player_spawn(_map_width, _map_height){
    var _center_x = _map_width div 2;
    var _center_y = _map_height div 2;
    
    var _spawn_x = (_center_x * TILE_SIZE) + (TILE_SIZE / 2);
    var _spawn_y = (_center_y * TILE_SIZE) + (TILE_SIZE / 2);
    
    if(instance_exists(obj_player)){
        instance_destroy(obj_player);
    }
    
    instance_create_layer(_spawn_x, _spawn_y, "Player", obj_player);
}