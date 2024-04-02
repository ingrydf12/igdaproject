/// @description DESCRIÇÃO FODA
var gw = display_get_gui_width();
var gh = display_get_gui_height();
var c = c_black;

draw_set_alpha(.8);
draw_rectangle_color(0,0,gw,gh,c,c,c,c,false);
draw_set_alpha(1);
draw_sprite_ext(scontrols,0,gw/2,gh/2,escala,escala,0,c_white,1)