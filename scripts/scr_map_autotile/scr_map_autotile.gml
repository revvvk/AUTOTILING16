///@description Desenha os tiles no mapa
///@param {array} _map Array 2D do mapa
///@param {array} _tile_variations Array container com os arrays de variações de tiles
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
function scr_map_autotile(_map, _tile_variations, _map_width, _map_height){
    //CRIANDO UMA TABELA PARA AS POSIÇÕES DOS TILES
    //LOOK UP TABLE
    var _table = array_create(256, 0);
    
    //PILAR
    _table[0]   = PILLAR;
    
    //VAZIO
    _table[255] = VOID;
    
    //PAREDES ORTOGONAIS (CIMA, BAIXO, ESQUERDA E DIREITA)
    _table[155] = TOP_MID_WALL;
    _table[110] = BOT_MID_WALL;
    _table[205] = LEFT_WALL;
    _table[55]  = RIGHT_WALL;
    
    //CANTOS SUPERIORES E INFERIORES
    _table[223] = TOP_LEFT_CORNER;
    _table[191] = TOP_RIGHT_CORNER;
    _table[239] = BOT_LEFT_CORNER;
    _table[127] = BOT_RIGHT_CORNER;
    
    //CANTOS INTERIORES SUPERIORES E INFERIORES
    _table[76]  = TOP_RIGHT_INNER_CORNER;
    _table[38]  = TOP_LEFT_INNER_CORNER;
    _table[19]  = BOT_LEFT_INNER_CORNER;
    _table[137] = BOT_RIGHT_INNER_CORNER;
    
    //PAREDE HORIZONTAL NO MEIO DA SALA
    _table[2]   = H_WALL_LEFT;
    _table[10]  = H_WALL_MID;
    _table[8]   = H_WALL_RIGHT;
    
    //PAREDE VERTICAL NO MEIO DA SALA
    _table[4]   = V_WALL_TOP;
    _table[5]   = V_WALL_MID;
    _table[1]   = V_WALL_BOT;
    
    //JUNÇÕES EM T
    _table[159] = T_TOP;
    _table[111] = T_BOT;
    _table[63]  = T_RIGHT;
    _table[207] = T_LEFT;
    
    //JUNÇÕES EM T NO MEIO DA SALA
    _table[14]  = T_INNER_TOP;
    _table[11]  = T_INNER_BOT;
    _table[13]  = T_INNER_RIGHT;
    _table[7]   = T_INNER_LEFT;
    
    //CRUZ QUE LIGA T E L NO MEIO DA SALA
    _table[15]  = CROSS;
    
    //JUNÇÕES EM L NO MEIO DA SALA
    _table[6]   = L_INNER_TOP_LEFT;
    _table[12]  = L_INNER_TOP_RIGHT;
    _table[3]   = L_INNER_BOT_LEFT;
    _table[9]   = L_INNER_BOT_RIGHT;
    
    //JUNÇÕES EM L VERTICAIS PARA FORA DO MAPA OU PAREDES NO MEIO DA SALA
    _table[23]  = L_V_TOP_LEFT;
    _table[141] = L_V_TOP_RIGHT;
    _table[39]  = L_V_BOT_LEFT;
    _table[77]  = L_V_BOT_RIGHT;
    
    //JUNÇÕES EM L HORIZONTAIS PAR FORA DO MAPA OU PAREDES NO MEIO DA SALA
    _table[78]  = L_H_TOP_LEFT;
    _table[46]  = L_H_TOP_RIGHT;
    _table[139] = L_H_BOT_LEFT;
    _table[27]  = L_H_BOT_RIGHT;
    
    //3 QUINAS SE ENCONTRANDO    
    _table[31]  = Y_TOP_LEFT
    _table[143] = Y_TOP_RIGHT;
    _table[47]  = Y_BOT_LEFT;
    _table[79]  = Y_BOT_RIGHT;
    
    //QUINAS SE ENCONTRANDO NA DIAGONAL
    _table[95]  = D_RIGHT;
    _table[175] = D_LEFT;
    
    
    
    //---
    
    
    
    //pegando o id dos tilemaps de chão e parede
    var _tilemap_floor      = layer_tilemap_get_id("tls_floor");
    var _tilemap_walls      = layer_tilemap_get_id("tls_walls");
    var _tilemap_walls_top  = layer_tilemap_get_id("tls_walls_top");
    
    //FORÇA O MAPA A SE DESENHAR NO TAMANHO REQUERIDO
    tilemap_set_width(_tilemap_floor, _map_width);
    tilemap_set_height(_tilemap_floor, _map_height);
    tilemap_set_width(_tilemap_walls, _map_width);
    tilemap_set_height(_tilemap_walls, _map_height);
    tilemap_set_width(_tilemap_walls_top, _map_width);
    tilemap_set_height(_tilemap_walls_top, _map_height);
    
    //limpando os tilemaps para os desenhos não se sobrescreverem
    tilemap_clear(_tilemap_floor, 0);
    tilemap_clear(_tilemap_walls, 0);
    tilemap_clear(_tilemap_walls_top, 0);
    
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            //se a posição for chão, desenha o chão
            if(_map[_i][_j] == TILE_FLOOR){
                //desenha o chão nas posições corretas na camada de chão
                tilemap_set(_tilemap_floor, FLOOR, _i, _j);
                //pula para o resto do código depois de desenhar o chão, pois o resto é parede
                continue;
            }
            
            //pegando as posições ortogonais (direita, esquerda, cima e baixo)
            var _north  = (_j == 0) || (_map[_i][_j - 1] == TILE_WALL);
            var _east   = (_i == _map_width - 1) || (_map[_i + 1][_j] == TILE_WALL);
            var _south  = (_j == _map_height - 1) || (_map[_i][_j + 1] == TILE_WALL);
            var _west   = (_i == 0) || (_map[_i - 1][_j] == TILE_WALL);
            
            //pegando as posições diagonais apenas se existir parede nas posições ortogonais
            var _northeast = _north && _east && ((_i == _map_width - 1 || _j == 0) || (_map[_i + 1][_j - 1] == TILE_WALL));
            var _southeast = _south && _east && ((_i == _map_width - 1 || _j == _map_height - 1) || (_map[_i + 1][_j + 1] == TILE_WALL));
            var _southwest = _south && _west && ((_i == 0 || _j == _map_height - 1) || (_map[_i - 1][_j + 1] == TILE_WALL));
            var _northwest = _north && _west && ((_i == 0 || _j == 0) || (_map[_i - 1][_j - 1] == TILE_WALL));
            
            //calculando o bitmask
            var _bitmask = (_north * 1) + (_east * 2) + (_south * 4) + (_west * 8) +
                            (_northeast * 16) + (_southeast * 32) + (_southwest * 64) + (_northwest * 128);
            
            //posição do tile dentro da tabela
            var _tile_id = _table[_bitmask];
            
            
            //verificando se o tile de topo calculado pelo bitmask é o TOP_MID_WALL
            //para aplicar suas variações apenas nele e não em todos os tiles de topo
            if(_tile_id == TOP_MID_WALL){
                _tile_id = _tile_variations[VAR_TOP_MID_WALL][_i][_j];
            }
            
            //desenhando os tiles no mapa na camada de paredes
            tilemap_set(_tilemap_walls_top, _tile_id, _i, _j - 1);
            
            
            //lendo a variação sorteada para a célula e a usa como indice do tileset
            var _wall_face_tile = _tile_variations[VAR_WALL_FACE][_i][_j];
            
            //aplica os tiles de face de parede sorteados aleatóriamente
            tilemap_set(_tilemap_walls, _wall_face_tile, _i, _j);
            
            
            //aplica os tiles de face de parede
            //tilemap_set(_tilemap_walls, WALL_FACE, _i, _j);
        }
    }
}