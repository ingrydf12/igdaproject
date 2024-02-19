//DEBUG VISUAL////////////////////////////////
var tam = obj_mapa.tam_cell;
var _d = point_distance(x, y, dest_x, dest_y);
var _p = instance_nearest(x, y, obj_player);

draw_set_color(c_red)
draw_set_alpha(.4);
draw_circle(x, y, dist_perigo, false); //debug visual área e perigo
draw_set_alpha(1);
draw_set_color(c_yellow);
draw_path(caminho,dest_x,dest_y,true); //debug visual ponto do caminho
draw_set_color(c_green);
draw_line_width(x, y, dest_x, dest_y, 1);  //debug visual ponto de destino
draw_set_color(c_aqua);
draw_line_width(x, y, _p.x, _p.y, 1); //debug visual ponto do player mais próximo
draw_set_color(c_white);



draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y - 20, _d); //destino
draw_text(x, y + 20, est); //estado
draw_text(x, y + 40, vida); //vida
draw_set_halign(-1);
draw_set_valign(-1);
//////////////////////////////////////////////