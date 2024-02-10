// Script assets have changed for v2.3.0 see
function colisao_inimigo(){
	if place_meeting(x + hspd, y, obj_colisor) {
		while !place_meeting(x + sign(hspd), y, obj_colisor) {
			x += sign(hspd);
		}
		
		estado = escolher_estado;
		hspd = 0;
	}
	
	x += hspd;
	
	if place_meeting(x, y + vspd, obj_colisor) {
		while !place_meeting(x, y + sign(vspd), obj_colisor) {
			y += sign(vspd);
		}
		
		estado = escolher_estado;
		vspd = 0;
	}
	
	y += vspd;
	
}

function escolher_estado() {
	prox_estado = choose(inimigo_andar, inimigo_parado);
	
	if prox_estado == inimigo_andar {
		spd = 0;
		est = "andar";
		estado = inimigo_andar;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	} else if prox_estado == inimigo_parado {
		est = "parar";
		estado = inimigo_parado;
	}
	
	//switch prox_estado {
	//	default:
	//		est = "parado";
	//		alarm[0] = irandom_range(120, 600);
	//		estado = inimigo_parado;
	//	break;
	//	case inimigo_andar:
	//		est = "andar";
	//		estado = inimigo_andar;
	//		dest_x = irandom_range(0, room_width);
	//		dest_y = irandom_range(0, room_height);
	//	break;
	//}
}



function inimigo_andar(){
	//checar_player();
	image_speed = 1;
	
	if point_distance(x, y, dest_x, dest_y) > 2 {
		if hspd != 0 or vspd != 0 {
			if spd < 4 {
				if spd < .8 {
					spd += .04;
				} else if spd < 2 {
					spd += .1;
				} else {
					spd += .2;
				}
			}
		} else {
			spd = 0;
		}
		
		dir = point_direction(x, y, dest_x, dest_y);
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
		
		colisao_inimigo();
		
	} else {
		x = dest_x;
		y = dest_y;
	}
}

function inimigo_parado() {
	image_speed = .8;
}

//function checar_player() {
//	if distance_to_object(obj_player1) <= dist_perigo {
//		estado = inimigo_perseguir;
//	}
//}

//function inimigo_perseguir() {
//	image_speed = 1.2;
	
//	dest_x = obj_player1.x;
//	dest_y = obj_player1.y;
	
//	dir = point_direction(x, y, dest_x, dest_y);
//	hspd = lengthdir_x(spd*1.2, dir);
//	vspd = lengthdir_y(spd*1.2, dir);
	
//	colisao_inimigo();
	
//	if distance_to_object(obj_player1) >= dist_segura {
//		estado = escolher_estado;
//		alarm[0] = irandom_range(80, 300);
//	}
//}