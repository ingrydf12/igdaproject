/// @description Insert description here
if !instance_exists(obj_player) {
	exit;
}
if spawn and ispawn < imaximo {
	//definir um x e y de spawn do inimigo
	var xx = irandom_range(0, room_width); //ponto x de spawn
	var yy = irandom_range(0, room_height); //ponto y de spawn
	
	var p = instance_nearest(x, y, obj_player); //jogador mais próximo
	
	//evitar spawnar dentro de parede e muito próximo a um player
	if point_distance(xx, yy, p.x, p.y) <= 160 and place_meeting(xx, yy, obj_colisor){
		exit;
	}
	
	spawn = !spawn;
	timer = irandom_range(90, 170);
	ispawn++;
	
	instance_create_layer(xx, yy, "inimigos", obj_enemy);
}

if timer > 0 {
	timer--;
} else {
	spawn = !spawn;
}