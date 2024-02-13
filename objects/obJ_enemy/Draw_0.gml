//DEBUG VISUAL////////////////////////////////
draw_self();
var _d = point_distance(x, y, dest_x, dest_y);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y - 20, _d); //destino
draw_text(x, y + 20, est); //estado
draw_text(x, y + 40, vida); //vida
draw_set_halign(-1);
draw_set_valign(-1);
//////////////////////////////////////////////