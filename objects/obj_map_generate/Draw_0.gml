/// @description Insert description here
// You can write your code in this editor


if(keyboard_check_released(vk_tab)){
    is_debugging = !is_debugging;
}

if(is_debugging){
    // Percorre a largura e altura que você definiu no Create
    for(var _i = 0; _i < MAP_WIDTH; _i++){
        for(var _j = 0; _j < MAP_HEIGHT; _j++){
            
            // Verifica se essa posição no seu array é parede
            if(map_dungeon[_i][_j] == TILE_WALL){
                
                //pegando as posições ortogonais (direita, esquerda, cima e baixo)
                var _north  = (_j == 0) || (map_dungeon[_i][_j - 1] == TILE_WALL);
                var _east   = (_i == MAP_WIDTH - 1) || (map_dungeon[_i + 1][_j] == TILE_WALL);
                var _south  = (_j == MAP_HEIGHT - 1) || (map_dungeon[_i][_j + 1] == TILE_WALL);
                var _west   = (_i == 0) || (map_dungeon[_i - 1][_j] == TILE_WALL);
                
                //pegando as posições diagonais apenas se existir parede nas posições ortogonais
                var _northeast = _north && _east && ((_i == MAP_WIDTH - 1 || _j == 0) || (map_dungeon[_i + 1][_j - 1] == TILE_WALL));
                var _southeast = _south && _east && ((_i == MAP_WIDTH - 1 || _j == MAP_HEIGHT - 1) || (map_dungeon[_i + 1][_j + 1] == TILE_WALL));
                var _southwest = _south && _west && ((_i == 0 || _j == MAP_HEIGHT - 1) || (map_dungeon[_i - 1][_j + 1] == TILE_WALL));
                var _northwest = _north && _west && ((_i == 0 || _j == 0) || (map_dungeon[_i - 1][_j - 1] == TILE_WALL));
                
                //calculando o bitmask
                var _bitmask = (_north * 1) + (_east * 2) + (_south * 4) + (_west * 8) +
                                (_northeast * 16) + (_southeast * 32) + (_southwest * 64) + (_northwest * 128);
                
                
                
                //DESENHA O TEXTO NA TELA
                //Define o alinhamento para o centro
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_color(c_yellow);
                
                
                //Desenha com 40% do tamanho original (0.4)
                //O "+ 8" é para centralizar em um tile de 16x16 (metade de 16)
                draw_text_transformed(_i * 32 + 16, _j * 32 + 16, string(_bitmask), 0.4, 0.4, 0);
                
                
                //Reseta o alinhamento para não quebrar outros textos do jogo
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
            }
        }
    }
}

