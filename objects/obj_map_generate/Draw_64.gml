/// @description Insert description here
// You can write your code in this editor

if(hover_structured){
    draw_set_colour(c_orange);
}
else{
    draw_set_colour(c_white);
}

draw_rectangle(gui_x - button_width / 2, gui_y - button_height / 2,
                gui_x + button_width / 2, gui_y + button_height / 2,
                false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
//draw_text(gui_x, gui_y, texto);
draw_text_colour(gui_x, gui_y, texto, c_black, c_black, c_black, c_black, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);


if(hover_organic){
    draw_set_colour(c_olive);
}
else{
    draw_set_colour(c_white);
}

draw_rectangle(gui_x2 - button_width / 2, gui_y2 - button_height / 2,
                gui_x2 + button_width / 2, gui_y2 + button_height / 2,
                false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
var _texto = "organic";

draw_text_colour(gui_x2, gui_y2, _texto, c_black, c_black, c_black, c_black, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);










