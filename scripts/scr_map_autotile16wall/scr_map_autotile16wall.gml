///@description Desenha os tiles no mapa
///@param {array} _map Array 2D do mapa
///@param {real} _map_width Largura do mapa
///@param {real} _map_height Altura do mapa
function scr_map_autotile16wall(_map, _map_width, _map_height){ 
    
    //ARRAY DE TRADUÇÃO COM A LOOK UP TABLE
    //criando o array
    var _table = array_create(256, 0);
    
    ////MAPEAMENTO DA POSIÇÃO DE CADA TILE DENTRO DA SPRITE
        //_table[0]   = 20; //BLOCO DE PAREDE ISOLADO CERCADO POR CHÃO (PILAR)
        //_table[16]  = 20;
        //_table[32]  = 20;
        //_table[48]  = 20;
        //_table[64]  = 20;
        //_table[80]  = 20;
        //_table[96]  = 20;
        //_table[128] = 20;
        //_table[144] = 20;
        //_table[160] = 20;
        //_table[192] = 20;
        //_table[208] = 20;
        //_table[224] = 20;
        //_table[112] = 20;
    //
        //var _h_wall_left = 17;
        //_table[2]   = _h_wall_left; //LADO ESQUERDO DA PAREDE NO MEIO DA SALA (MURO HORIZONTAL)
        //_table[18]  = _h_wall_left;
        //_table[34]  = _h_wall_left;
        //_table[50]  = _h_wall_left;
        //_table[66]  = _h_wall_left;
        //_table[82]  = _h_wall_left;
        //_table[98]  = _h_wall_left;
        //_table[114] = _h_wall_left;
        //_table[130] = _h_wall_left;
        //_table[146] = _h_wall_left;
        //_table[162] = _h_wall_left;
        //_table[178] = _h_wall_left;
        //_table[194] = _h_wall_left;
        //_table[210] = _h_wall_left;
    //
        //var _h_wall_mid = 18;
        //_table[10]  = _h_wall_mid; //MEIO DA PAREDE HORIZONTAL NO MEIO DA SALA
        //_table[26]  = _h_wall_mid;
        //_table[42]  = _h_wall_mid;
        //_table[58]  = _h_wall_mid;
        //_table[74]  = _h_wall_mid;
        //_table[90]  = _h_wall_mid;
        //_table[106] = _h_wall_mid;
        //_table[122] = _h_wall_mid;
        //_table[138] = _h_wall_mid;
        //_table[154] = _h_wall_mid;
        //_table[170] = _h_wall_mid;
        //_table[186] = _h_wall_mid;
        //_table[202] = _h_wall_mid;
        //_table[218] = _h_wall_mid;
        //_table[234] = _h_wall_mid;
        //_table[250] = _h_wall_mid;
    //
        //var _h_wall_right = 19;
        //_table[8]   = _h_wall_right; //LADO DIREITO DA PAREDE NO MEIO DA SALA
        //_table[24]  = _h_wall_right;
        //_table[40]  = _h_wall_right;
        //_table[56]  = _h_wall_right;
        //_table[72]  = _h_wall_right;
        //_table[88]  = _h_wall_right;
        //_table[104] = _h_wall_right;
        //_table[136] = _h_wall_right;
        //_table[152] = _h_wall_right;
        //_table[168] = _h_wall_right;
        //_table[200] = _h_wall_right;
        //_table[216] = _h_wall_right;
        //_table[226] = _h_wall_right;
        //_table[232] = _h_wall_right;
        //_table[248] = _h_wall_right;
    //
        //var _v_wall_bot = 16;
        //_table[1]   = _v_wall_bot; //LADO DE BAIXO DA PAREDE NO MEIO DA SALA (MURO VERTICAL)
        //_table[17]  = _v_wall_bot;
        //_table[33]  = _v_wall_bot;
        //_table[49]  = _v_wall_bot;
        //_table[65]  = _v_wall_bot;
        //_table[81]  = _v_wall_bot;
        //_table[97]  = _v_wall_bot;
        //_table[129] = _v_wall_bot;
        //_table[145] = _v_wall_bot;
        //_table[161] = _v_wall_bot;
        //_table[177] = _v_wall_bot;
        //_table[193] = _v_wall_bot;
        //_table[209] = _v_wall_bot;
    //
        //var _v_wall_mid = 10;
        //_table[5]   = _v_wall_mid; //MEIO DA PAREDE VERTICAL NO MEIO DA SALA
        //_table[21]  = _v_wall_mid;
        //_table[37]  = _v_wall_mid;
        //_table[53]  = _v_wall_mid;
        //_table[69]  = _v_wall_mid;
        //_table[85]  = _v_wall_mid;
        //_table[101] = _v_wall_mid;
        //_table[117] = _v_wall_mid;
        //_table[133] = _v_wall_mid;
        //_table[149] = _v_wall_mid;
        //_table[165] = _v_wall_mid;
        //_table[181] = _v_wall_mid;
        //_table[197] = _v_wall_mid;
        //_table[213] = _v_wall_mid;
        //_table[229] = _v_wall_mid;
        //_table[245] = _v_wall_mid;
    //
        //var _v_wall_top = 4;
        //_table[4]   = _v_wall_top; //LADO DE CIMA DA PAREDE NO MEIO DA SALA
        //_table[20]  = _v_wall_top;
        //_table[36]  = _v_wall_top;
        //_table[52]  = _v_wall_top;
        //_table[68]  = _v_wall_top;
        //_table[84]  = _v_wall_top;
        //_table[100] = _v_wall_top;
        //_table[116] = _v_wall_top;
        //_table[132] = _v_wall_top;
        //_table[148] = _v_wall_top;
        //_table[164] = _v_wall_top;
        //_table[180] = _v_wall_top;
        //_table[196] = _v_wall_top;
        //_table[212] = _v_wall_top;
        //_table[228] = _v_wall_top;
    //
        //var _wall_right = 9;
        //_table[55]  = _wall_right; //PAREDE LATERAL DIREITA
        //_table[119] = _wall_right;
        //_table[183] = _wall_right;
        //_table[247] = _wall_right;
    //
        //var _wall_left = 7;
        //_table[205] = _wall_left; //PAREDE LATERAL ESQUERDA
        //_table[221] = _wall_left;
        //_table[237] = _wall_left;
        //_table[253] = _wall_left;
    //
        //var _wall_north = 2;
        //_table[155] = _wall_north; //PAREDE DO NORTE
        //_table[187] = _wall_north;
        //_table[219] = _wall_north;
        //_table[251] = _wall_north;
    //
        //var _wall_south = 14;
        //_table[110] = _wall_south; //PAREDE DO SUL
        //_table[126] = _wall_south;
        //_table[238] = _wall_south;
        //_table[254] = _wall_south;
    //
        //var _top_inner_right_corner = 23;
        //_table[76]  = _top_inner_right_corner; //CANTO SUPERIOR INTERIOR DIREITO
        //_table[92]  = _top_inner_right_corner;
        //_table[108] = _top_inner_right_corner;
        //_table[124] = _top_inner_right_corner;
        //_table[204] = _top_inner_right_corner;
        //_table[220] = _top_inner_right_corner;
        //_table[236] = _top_inner_right_corner;
        //_table[252] = _top_inner_right_corner;
    //
        //var _top_inner_left_corner = 22;
        //_table[38]  = _top_inner_left_corner; //CANTO SUPERIOR INTERIOR ESQUERDO
        //_table[54]  = _top_inner_left_corner;
        //_table[102] = _top_inner_left_corner;
        //_table[118] = _top_inner_left_corner;
        //_table[166] = _top_inner_left_corner;
        //_table[182] = _top_inner_left_corner;
        //_table[230] = _top_inner_left_corner;
        //_table[246] = _top_inner_left_corner;
    //
        //var _bot_inner_right_corner = 5;
        //_table[137] = _bot_inner_right_corner; //CANTO INFERIOR INTERIOR DIREITO
        //_table[153] = _bot_inner_right_corner;
        //_table[169] = _bot_inner_right_corner;
        //_table[185] = _bot_inner_right_corner;
        //_table[201] = _bot_inner_right_corner;
        //_table[217] = _bot_inner_right_corner;
        //_table[233] = _bot_inner_right_corner;
        //_table[249] = _bot_inner_right_corner;
    //
        //var _bot_inner_left_corner = 6;
        //_table[19]  = _bot_inner_left_corner; //CANTO INFERIOR INTERIOR ESQUERDO
        //_table[51]  = _bot_inner_left_corner;
        //_table[83]  = _bot_inner_left_corner;
        //_table[99]  = _bot_inner_left_corner;
        //_table[115] = _bot_inner_left_corner;
        //_table[147] = _bot_inner_left_corner;
        //_table[179] = _bot_inner_left_corner;
        //_table[211] = _bot_inner_left_corner;
        //_table[243] = _bot_inner_left_corner;
    //
        //var _top_left_corner = 1;
        //_table[223] = _top_left_corner; //CANTO SUPERIOR EXTERIOR ESQUERDO
    //
        //var _top_right_corner = 3;
        //_table[191] = _top_right_corner; //CANTO SUPERIOR EXTERIOR DIREITO
    //
        //_table[173] = 11;
        //_table[215] = 12;
    //
        //var _bot_left_corner = 13;
        //_table[239] = _bot_left_corner;
    ////
        //var _bot_right_corner = 15;
        //_table[127] = _bot_right_corner;
    //
        //_table[175] = 21;
        //_table[95]  = 24;
    //
        //_table[27]  = 30;
        //_table[59]  = 30;
        //_table[91]  = 30;
        //_table[123] = 30;
    //
        //_table[139] = 31;
        //_table[171] = 31;
        //_table[203] = 31;
        //_table[235] = 31;
    //
        //_table[46]  = 28;
        //_table[62]  = 28;
        //_table[174] = 28;
        //_table[190] = 28;
    //
        //_table[78]  = 29;
        //_table[94]  = 29;
        //_table[206] = 29;
        //_table[222] = 29;
    //
        //_table[207] = 26;
        //_table[63]  = 27;
    //
        //_table[9]   = 32;
        //_table[41]  = 32;
        //_table[89]  = 32;
    //
        //_table[3]   = 33;
    //
        //_table[141] = 34;
        //_table[157] = 34;
        //_table[189] = 34;
    //
        //_table[23]  = 35;
        //_table[87]  = 35;
        //_table[151] = 35;
    //
        //_table[111] = 36;
        //_table[159] = 37;
    //
        //_table[39]  = 38;
        //_table[103] = 38;
        //_table[167] = 38;
        //_table[231] = 38;
    //
        //_table[77]  = 39;
        //_table[93]  = 39;
        //_table[109] = 39;
        //_table[125] = 39;
    //
        //_table[6]   = 40;
        //_table[22]  = 40;
        //_table[70]  = 40;
        //_table[86]  = 40;
        //_table[134] = 40;
        //_table[150] = 40;
        //_table[198] = 40;
        //_table[214] = 40;
    //
        //_table[12]  = 41;
        //_table[28]  = 41;
        //_table[44]  = 41;
        //_table[60]  = 41;
        //_table[140] = 41;
        //_table[156] = 41;
        //_table[172] = 41;
    //
        //_table[35]  = 42;
        //_table[67]  = 42;
        //_table[131] = 42;
        //_table[163] = 42;
        //_table[195] = 42;
        //_table[227] = 42;
    //
        //_table[25]  = 43;
        //_table[57]  = 43;
        //_table[73]  = 43;
        //_table[105] = 43;
        //_table[121] = 43;
    //
        //_table[15]  = 44;
    //
        //_table[7]   = 45;
        //_table[71]  = 45;
        //_table[135] = 45;
        //_table[143] = 45;
        //_table[199] = 45;
    //
        //_table[13]  = 46;
        //_table[29]  = 46;
        //_table[31]  = 46;
        //_table[45]  = 46;
        //_table[61]  = 46;
    //
        //_table[14]  = 47;
        //_table[30]  = 47;
        //_table[142] = 47;
        //_table[158] = 47;
    //
        //_table[11]  = 48;
        //_table[43]  = 48;
        //_table[75]  = 48;
        //_table[107] = 48;
    //
        //_table[47]  = 49;
    //
        //_table[79]  = 50;
    //
        //_table[255] = 25; //MIOLO DE PAREDE
    
    
    
    //pegando o id dos tilemaps de chão e parede
    var _tilemap_floor = layer_tilemap_get_id("tls_floor");
    var _tilemap_walls = layer_tilemap_get_id("tls_walls");
    
    //FORÇA O MAPA A SE DESENHAR NO TAMANHO REQUERIDO
    tilemap_set_width(_tilemap_floor, _map_width);
    tilemap_set_height(_tilemap_floor, _map_height);
    tilemap_set_width(_tilemap_walls, _map_width);
    tilemap_set_height(_tilemap_walls, _map_height);
    
    //limpando os tilemaps para os desenhos não se sobrescreverem
    tilemap_clear(_tilemap_floor, 0);
    tilemap_clear(_tilemap_walls, 0);
    
    
    ////percorrendo pelo mapa para verificar as células que são chão
    //for(var _i = 0; _i < _map_width; _i++){
        //for(var _j = 0; _j < _map_height; _j++){
            //
            ////tilemap_set(_tilemap_walls, 1, _i, _j);
            //
            ////se a célula for chão, coloca o tile de chão
            //if(_map[_i][_j] == TILE_FLOOR){
                ////coloca o tile de chão
                //tilemap_set(_tilemap_floor, 8, _i, _j);
            //}
            //
            //////calculando os vizinhos com base na parede para criar o bitmask
            ////var _north  = (_j > 0 && _map[_i][_j - 1] == TILE_WALL);
            ////var _east   = (_i < _map_width - 1 && _map[_i + 1][_j] == TILE_WALL);
            ////var _south  = (_j < _map_height - 1 && _map[_i][_j + 1] == TILE_WALL);
            ////var _west   = (_i > 0 && _map[_i - 1][_j] == TILE_WALL);
            ////
            ////
            //////calculando os vizinhos na diagonal
            ////var _northeast = (_i < _map_width - 1 && _j > 0 && _map[_i + 1][_j - 1] == TILE_WALL);
            ////var _southeast = (_i < _map_width - 1 && _j < _map_height - 1 && _map[_i + 1][_j + 1] == TILE_WALL);
            ////var _southwest = (_i > 0 && _j < _map_height - 1 && _map[_i - 1][_j + 1] == TILE_WALL);
            ////var _northwest = (_i > 0 && _j > 0 && _map[_i - 1][_j - 1] == TILE_WALL);
            ////
            ////
            //////cálculo do bitmask baseado nos vizinhos de chão
            ////var _bitmask = (_north * 1) + (_east * 2) + (_south * 4) + (_west * 8) +
                            ////(_northeast * 16) + (_southeast * 32) + (_southwest * 64) + (_northwest * 128);
            ////
            //
            //
            //// 1. Ortogonais (Norte, Leste, Sul, Oeste)
            //var _north = (_j == 0) || (_map[_i][_j - 1] == TILE_WALL);
            //var _east  = (_i == _map_width - 1) || (_map[_i + 1][_j] == TILE_WALL);
            //var _south = (_j == _map_height - 1) || (_map[_i][_j + 1] == TILE_WALL);
            //var _west  = (_i == 0) || (_map[_i - 1][_j] == TILE_WALL);
            //
            //// 2. Diagonais (Nordeste, Sudeste, Sudoeste, Noroeste)
            //var _northeast = (_i == _map_width - 1 || _j == 0) || (_map[_i + 1][_j - 1] == TILE_WALL);
            //var _southeast = (_i == _map_width - 1 || _j == _map_height - 1) || (_map[_i + 1][_j + 1] == TILE_WALL);
            //var _southwest = (_i == 0 || _j == _map_height - 1) || (_map[_i - 1][_j + 1] == TILE_WALL);
            //var _northwest = (_i == 0 || _j == 0) || (_map[_i - 1][_j - 1] == TILE_WALL);
            //
            //// 3. Cálculo do bitmask (Peso das 8 direções)
            //var _bitmask = (_north * 1) + (_east * 2) + (_south * 4) + (_west * 8) +
                           //(_northeast * 16) + (_southeast * 32) + (_southwest * 64) + (_northwest * 128);
            //
            ////DESENHANDO OS TILES COM BASE NO VALOR DO BITMASK
            //if(_map[_i][_j] == TILE_WALL){
                ////pega o número do indice do tile definido na tabela
                //var _tile_id = _table[_bitmask];
                //
                ////desenha o tile certo na camada de paredes
                //tilemap_set(_tilemap_walls, _tile_id, _i, _j);
            //}
        //}
    //}
    
    
    //V2
    
    
    for(var _i = 0; _i < _map_width; _i++){
        for(var _j = 0; _j < _map_height; _j++){
            
            // Se a célula for chão, coloca o tile de chão e pula para a próxima iteração
            if(_map[_i][_j] == TILE_FLOOR){
                tilemap_set(_tilemap_floor, 8, _i, _j);
                continue; // Pula o resto do código deste loop, pois é parede
            }
            
            // 1. Ortogonais (Paredes diretas)
            var _n = (_j == 0) || (_map[_i][_j - 1] == TILE_WALL);
            var _e = (_i == _map_width - 1) || (_map[_i + 1][_j] == TILE_WALL);
            var _s = (_j == _map_height - 1) || (_map[_i][_j + 1] == TILE_WALL);
            var _w = (_i == 0) || (_map[_i - 1][_j] == TILE_WALL);
            
            // 2. Diagonais (Só existem se os dois vizinhos retos forem PAREDE)
            var _ne = _n * _e * ((_i == _map_width - 1 || _j == 0) || (_map[_i + 1][_j - 1] == TILE_WALL));
            var _se = _s * _e * ((_i == _map_width - 1 || _j == _map_height - 1) || (_map[_i + 1][_j + 1] == TILE_WALL));
            var _sw = _s * _w * ((_i == 0 || _j == _map_height - 1) || (_map[_i - 1][_j + 1] == TILE_WALL));
            var _nw = _n * _w * ((_i == 0 || _j == 0) || (_map[_i - 1][_j - 1] == TILE_WALL));
            
            // 3. O Bitmask (A soma FINAL que vai para o debug)
            var _bitmask = (_n * 1) + (_e * 2) + (_s * 4) + (_w * 8) +
                           (_ne * 16) + (_se * 32) + (_sw * 64) + (_nw * 128);
            
            // 4. Seleção do Tile e Variação
            var _tile_id = _table[_bitmask];
            
            // Desenha na camada de paredes
            tilemap_set(_tilemap_walls, _tile_id, _i, _j);
        }
    }
}