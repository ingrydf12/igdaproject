///@description SCRIPT VOLTADO PARA MONTAR E DESENVOLVER O CONJUNTO DE AÇÕES/ESTADOS DOS INIMIGOS, ASSIM COMO SEUS COMPLEMENTOS (COLISÃO, ALTERNÂNCIA DE 'SPD'...)

function colisao_inimigo(){
	
	#region Colisão Horizontal
	//Colisão Horizontal (eixo x) do objeto -> Verifica se o objeto está a pelo menos 'hspd' (spd horizontal) de pixel do colisor
	if place_meeting(x + hspd, y, obj_colisor) {
		while !place_meeting(x + sign(hspd), y, obj_colisor) {
			//Sign pega a direção -> Se o 'hsp' estiver em -10, o sign transforma em -1; Se o 'hsp' estiver em 10, o sign transforma em 1;
			x += sign(hspd);
		}
		
		//Caso o objeto esteja a 1 pixel de distância do colisor, zerar a 'hspd' e faça-o escolher outro estado
		estado = escolher_estado;
		hspd = 0;
	}
	
	x += hspd;
	//Aqui encerra o 'if' da colisão horizontal
	#endregion Colisão Horizontal
	
	#region Colisão Vertical
	//Aqui é igual ao código acima, porém é de forma vertical (CTRL C + CTRL V e muda os valores...)
	if place_meeting(x, y + vspd, obj_colisor) {
		while !place_meeting(x, y + sign(vspd), obj_colisor) {
			y += sign(vspd);
		}
		
		estado = escolher_estado;
		vspd = 0;
	}
	
	y += vspd;
	#endregion Colisão Vertical
	
}

function spd_inimigo() {
	//Mesma lógica do script do jogador, só muda uns valores de subtração
	if point_distance(x, y, dest_x, dest_y) > 2 {
		if hspd != 0 or vspd != 0 {
				if spd < wspd {
				var _vulto = instance_create_layer(x, y, layer, obj_rastro);
				_vulto.image_alpha = .09;
				_vulto.sprite_index = sprite_index;
				if spd < wspd/4 {
					spd += .04;
				} else if spd < wspd/2 {
					spd += .1;
				} else {
					_vulto = instance_create_layer(x, y, layer, obj_rastro);
					_vulto.image_alpha = .12;
					_vulto.sprite_index = sprite_index;
					spd += .2;
				}
			} else {
				var _vulto = instance_create_layer(x, y, layer, obj_rastro);
				_vulto.image_alpha = .26;
				_vulto.sprite_index = sprite_index;
			}
		} else {
			spd = 0;
		}
	}
}

function escolher_estado() {
	//Estado a ser executado pelo inimigo;
	prox_estado = choose(inimigo_andar, inimigo_parado);
	
	if prox_estado == inimigo_andar {
		//Atualiza o estado do player para "andar" e define um ponto (x e y) aleatório da sala pra se locomover
		estado = inimigo_andar;
		dest_x = irandom_range(0, room_width);
		dest_y = irandom_range(0, room_height);
	} else if prox_estado == inimigo_parado {
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
	est = "andar"; //Valor de debug visual
	checar_player();
	image_speed = 1;
	
	if point_distance(x, y, dest_x, dest_y) > 2 {
		spd_inimigo();
		
		//Mesma lógica do script do jogador
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
	est = "parar"; //Valor de debug visual
	
	spd = 0;
	checar_player();
	
	image_speed = .8;
}

function checar_player() {
	//Verifica se o jogador está dentro da área de perseguição do inimigo
	if distance_to_object(obj_player1) <= dist_perigo {
		estado = inimigo_perseguir;
	}
}

function inimigo_perseguir() {
	est = "perseg"; //Valor de debug visual
	image_speed = 1.2;
	
	dest_x = obj_player1.x;
	dest_y = obj_player1.y;
	
	spd_inimigo();
	
	dir = point_direction(x, y, dest_x, dest_y);
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);
	
	colisao_inimigo();
	
	if distance_to_object(obj_player1) >= dist_segura {
		estado = escolher_estado;
		alarm[0] = irandom_range(80, 300);
	}
}