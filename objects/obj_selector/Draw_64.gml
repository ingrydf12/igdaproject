/// @description DESCRIÇÃO FODA
var gw = display_get_gui_width();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(gw/2, 20, "Selecione o Player " + string(global.player_selector));

draw_set_valign(-1);
draw_set_halign(-1);