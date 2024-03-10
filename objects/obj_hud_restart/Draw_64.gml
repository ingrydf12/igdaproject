var x1 = camera_get_view_x(view_camera[0])
var camw = camera_get_view_width(view_camera[0])
var x2 = x1 + camw
var y1 = camera_get_view_y(view_camera[0])
var camh = camera_get_view_height(view_camera[0])
var y2 = y1 + camh
var qtd = camh * .15;
valor = lerp(valor, 1, .05); // animação


if morreu {
	//retangulo de cima 
	draw_set_color(c_black)
	draw_rectangle (x1,y1,x2,y1 + qtd * valor, false)
	//retangulo de baixo
	draw_rectangle(x1,y2,x2,y2 - qtd *valor, false)
	draw_set_color(-1);
	
}