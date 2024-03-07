/// @description Insert description here
if !instance_exists(obj_player) {
	exit;
}
if spawn and ispawn < imaximo {
	//definir um x e y de spawn do inimigo
	var a = [obj_spawn1, obj_spawn2, obj_spawn3];
	var i = irandom_range(0, array_length(a) - 1);
	
	var xx = a[i].x; //ponto x de spawn
	var yy = a[i].y; //ponto y de spawn
	
	var p = instance_nearest(xx, yy, obj_player); //jogador mais próximo
	
	//evitar spawnar dentro de parede e muito próximo a um player
	if point_distance(xx, yy, p.x, p.y) <= 160 {
		exit;
	}
	
	spawn = !spawn;
	timer = irandom_range(180, 300);
	ispawn++;
	
	instance_create_layer(xx, yy, "inimigos", obj_enemy);
}

if timer > 0 {
	timer--;
} else {
	spawn = !spawn;
}