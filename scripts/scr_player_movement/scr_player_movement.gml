///@description Movimentação do jogador
function scr_player_movement(){
    //se o player não pode se mover, zera as velocidades e sai do script
    if(!can_move){
        velh = 0;
        velv = 0;
        return;
    }
    
    //Leitura de INPUTS
    var _right  = keyboard_check(ord("D"));
    var _left   = keyboard_check(ord("A"));
    var _up     = keyboard_check(ord("W"));
    var _down   = keyboard_check(ord("S"));
    
    //direção desejada em cada eixo
    var _move_x = (_right - _left);
    var _move_y = (_down - _up);
    
    //velocidade alvo começa zerada
    var _target_velh = 0;
    var _target_velv = 0;
    
    //velocidade base de movimento
    var _move_speed = vel;
    
    //se detectar input, calcula a direção e converte em velocidade nos eixos
    if(_move_x != 0 || _move_y != 0){
        var _dir = point_direction(0, 0, _move_x, _move_y);
        
        //limitando a velocidade diagonal
        _target_velh = lengthdir_x(_move_speed, _dir);
        _target_velv = lengthdir_y(_move_speed, _dir);
    }
    
    //taxa de aceleração para chegar na velocidade alvo
    var _accel_rate = accel;
    
    //desacelerando suavemente se não detectar mais input
    if(_move_x == 0 && _move_y == 0){
        _accel_rate = decel;
    }
    
    //aproxima a velocidade atual da velocidade alvo
    velh = approach(velh, _target_velh, _accel_rate);
    velv = approach(velv, _target_velv, _accel_rate);
    
    //chama o script que checa a colisão do player na horizontal e vertical com as paredes
    scr_map_mov_collision(velh, velv);
}

//função que aproxima a velocidade atual da velocidade alvo para suavizar o movimento
function approach(_current_spd, _target_spd, _amount){
    //se a velocidade atual estiver abaixo da velocidade alvo, aumenta aos poucos
    if(_current_spd < _target_spd){
        return min(_current_spd + _amount, _target_spd);
    }
    
    //se a velocidade atual estiver acima da velocidade alvo, reduz aos poucos
    if(_current_spd > _target_spd){
        return max(_current_spd - _amount, _target_spd);
    }
    
    //se já chegou na velocidade alvo, mantém o valor
    return _target_spd;
}





















