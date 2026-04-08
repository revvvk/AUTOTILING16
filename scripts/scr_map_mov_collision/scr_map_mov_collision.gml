function scr_map_mov_collision(_move_x, _move_y){
        // Calcula os offsets reais do sprite usando bbox
    // offset é a distância do pivô até cada borda
    //borda esquerda
    var _offset_left    = x - bbox_left;
    //borda direita com - 1 para o ajuste correto da colisão
    var _offset_right   = bbox_right - x - 1;
    //borda de superior
    var _offset_top      = y - bbox_top;
    //borda de inferior com - 1 para o ajuste correto da colisão
    var _offset_bottom    = bbox_bottom - y - 1;
    
    
    //MOVIMENTO HORIZONTAL
    //arredonda o movimento horizontal para andar pixel por pixel (pixel perfect)
    var _total_x = _move_x + frac_x;
    //parte inteira do valor do movimento horizontal
    var _step_x = floor(abs(_total_x)) * sign(_total_x);
    //guarda o resto para o próximo frame
    frac_x = _total_x - _step_x;
    
    
    var _step_x_sign = sign(_step_x);
    
    //move no eixo x um pixel por vez para não atravessar a parede
    repeat(abs(_step_x)){
    	var _next_step_x = x + _step_x_sign;
        
        //checando os quatro cantos do sprite na próxima posição horizontal (x)
        var _collision_x = is_wall_at(_next_step_x - _offset_left, y - _offset_top) ||
                           is_wall_at(_next_step_x + _offset_right, y - _offset_top)  ||
                           is_wall_at(_next_step_x - _offset_left, y + _offset_bottom) ||
                           is_wall_at(_next_step_x + _offset_right, y + _offset_bottom);
        
        //se encontrou parede, para o movimento horizontal
        if(_collision_x){
            velh = 0;
            frac_x = 0;
            break;
        }
        
        //se não colidiu, aplica o próximo passo no x
        x = _next_step_x;
    }
    
    
    //MOVIMENTO VERTICAL
    //arredonda o movimento vertical para andar pixel por pixel
    var _total_y = _move_y + frac_y;
    var _step_y = floor(abs(_total_y)) * sign(_total_y);
    frac_y = _total_y - _step_y;
    
    var _step_y_sign = sign(_step_y);
    
    //move no eixo y um pixel por vez para não atravessar a parede
    repeat(abs(_step_y)){
    	var _next_step_y = y + _step_y_sign;
        
        //checando os quatro cantos do sprite na próxima posição vertical (y)
        var _collision_y = is_wall_at(x - _offset_left, _next_step_y - _offset_top) ||
                           is_wall_at(x + _offset_right, _next_step_y - _offset_top) ||
                           is_wall_at(x - _offset_left, _next_step_y + _offset_bottom) ||
                           is_wall_at(x + _offset_right, _next_step_y + _offset_bottom);
        
        //se encoutro parede, para o movimento vertical
        if(_collision_y){
            velv = 0;
            frac_y = 0;
            break;
        }
        
        //se não colidiu, aplica o próximo passo no y
        y = _next_step_y;
    }
}