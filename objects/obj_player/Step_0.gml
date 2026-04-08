/// @description Insert description here
// You can write your code in this editor


//sobreposição de sprites pelo depth
depth = -y;

//chamando o script de movimentação
scr_player_movement();

//testes
if(keyboard_check_released(ord("P"))){
    can_move = !can_move;
}

if(keyboard_check_released(ord(">"))){
    vel += 0.2;
}

show_debug_message("velocidades: " + string(vel) + "\nvelh: " + string(velh) + "\nvelv: " + string(velv));

//show_debug_message(is_wall_at(x, y));