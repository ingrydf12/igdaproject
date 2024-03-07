/// @description Insert description here
var glar = display_get_gui_width();
var galt = display_get_gui_height();
var c = c_black;

if morreu {
	draw_set_alpha(.6);
	draw_rectangle_color(glar/2 - 150, galt/2 - 80, glar/2 + 150, galt/2 + 80, c, c, c, c, false);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_set_font(fontmenu);
	draw_text(glar/2,galt/2, "Reiniciar");
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_alpha(1);
}