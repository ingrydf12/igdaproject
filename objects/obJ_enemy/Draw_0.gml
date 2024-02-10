/// @description Insert description here
draw_self();
var _d = point_distance(x, y, dest_x, dest_y);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y - 20, _d);
draw_text(x, y + 20, est);
draw_set_halign(-1);
draw_set_valign(-1);