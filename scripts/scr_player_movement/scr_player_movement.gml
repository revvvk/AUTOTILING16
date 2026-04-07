///@description Movimentação do jogador
function scr_player_movement(){
    //INPUTS
    var _right  = keyboard_check(ord("D"));
    var _left   = keyboard_check(ord("A"));
    var _up     = keyboard_check(ord("W"));
    var _down   = keyboard_check(ord("S"));
    
    //calcula a direção apertada dos eixos
    var _move_x = (_right - _left);
    var _move_y = (_down - _up);
    
    if(_move_x != 0 || _move_y != 0){
        //calcula o angulo exato da direção apontada pelos eixos
        var _dir = point_direction(0, 0, _move_x, _move_y);
        
        //calculando a movimentação em cada eixo baseada no angulo e velocidade
        //limitando a velocidade diagonal
        velh = lengthdir_x(vel, _dir);
        velv = lengthdir_y(vel, _dir);
    }
    
    else{
        velh = 0;
        velv = 0;
    }
    
    x += velh;
    y += velv;
}