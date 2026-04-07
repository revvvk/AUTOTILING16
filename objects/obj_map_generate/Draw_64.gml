/// @description Insert description here
// You can write your code in this editor


//alinhando o texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//muda a cor do botão quando o mouse esta sobre ele
if(hover_structured){
    draw_set_colour(c_orange);
}
else{
    draw_set_colour(c_white);
}

//desenha o botão
draw_rectangle(gui_x - button_width / 2, gui_y - button_height / 2,
                gui_x + button_width / 2, gui_y + button_height / 2,
                false);

//cor do texto do botão
draw_text_colour(gui_x, gui_y, texto_structured, c_black, c_black, c_black, c_black, 1);


//muda a cor do botão quando o mouse esta sobre ele
if(hover_organic){
    draw_set_colour(c_olive);
}
else{
    draw_set_colour(c_white);
}

//desenha o botão
draw_rectangle(gui_x2 - button_width / 2, gui_y2 - button_height / 2,
                gui_x2 + button_width / 2, gui_y2 + button_height / 2,
                false);

//cor do texto do botão
draw_text_colour(gui_x2, gui_y2, text_organic, c_black, c_black, c_black, c_black, 1);

//resetando o alinhamento
draw_set_halign(fa_left);
draw_set_valign(fa_top);










