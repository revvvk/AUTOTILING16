/// @description Insert description here
// You can write your code in this editor


//botão na tela para mudar de mapa
//pegando a posição do mouse na gui
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

//detectando se o mouse está sobre o retangulo do botão structured
hover_structured = point_in_rectangle( _mx, _my,
                                       gui_x - button_width / 2, gui_y - button_height / 2,
                                       gui_x + button_width / 2, gui_y + button_height / 2);



//detectando se o mouse está sobre o botão organic
hover_organic = point_in_rectangle(_mx, _my,
                                    gui_x2 - button_width / 2, gui_y2 - button_height / 2,
                                    gui_x2 + button_width / 2, gui_y2 + button_height / 2);


//checando se clicou
if(mouse_check_button_released(mb_left)){
    //checando sobre qual botão o mouse esta
    
    if(hover_structured){
        //chama o script que cria o mapa, passando structured
        scr_map_generate(texto_structured);
    }
    
    if(hover_organic){
        //chama o script que cria o mapa, passando organic
        scr_map_generate(text_organic);
    }
    

}