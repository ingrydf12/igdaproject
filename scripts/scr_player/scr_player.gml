// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function colisao(){
	if place_meeting(x + hspd, y, obj_colisor) {
		while !place_meeting(x + sign(hspd), y, obj_colisor) {
			x += sign(hspd);
		}
		
		hspd = 0;
	}
	
	x += hspd;
	
	if place_meeting(x, y + vspd, obj_colisor) {
		while !place_meeting(x, y + sign(vspd), obj_colisor) {
			y += sign(vspd);
		}
		
		vspd = 0;
	}	
	y += vspd;
}

function andar() {
	cima = keyboard_check(ord("W"));
	baixo = keyboard_check(ord("S"));
	esquerda = keyboard_check(ord("A"));
	direita = keyboard_check(ord("D"));

	hspd = direita - esquerda;
	vspd = baixo - cima;


	//retorno
	if hspd != 0 or vspd != 0 {
		if spd < wspd {
			var _vulto = instance_create_layer(x, y, layer, obj_rastro);
			_vulto.image_alpha = .09;
			_vulto.sprite_index = sprite_index;
			if spd < wspd/4 {
				spd += .08;
			} else if spd < wspd/2 {
				spd += .2;
			} else {
				_vulto = instance_create_layer(x, y, layer, obj_rastro);
				_vulto.image_alpha = .12;
				_vulto.sprite_index = sprite_index;
				spd += .4;
			}
		} else {
			var _vulto = instance_create_layer(x, y, layer, obj_rastro);
			_vulto.image_alpha = .26;
			_vulto.sprite_index = sprite_index;
		}
	} else {
		spd = 0;
	}
	
	dirspd = point_direction(x, y, x + hspd, y + vspd);
	
	hspd = lengthdir_x(spd, dirspd);
	vspd = lengthdir_y(spd, dirspd);
		
	colisao();
}