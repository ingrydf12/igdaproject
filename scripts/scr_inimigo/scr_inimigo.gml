///@description SCRIPT VOLTADO PARA MONTAR E DESENVOLVER O CONJUNTO DE AÇÕES/ESTADOS DOS INIMIGOS, ASSIM COMO SEUS COMPLEMENTOS (COLISÃO, ALTERNÂNCIA DE 'SPD'...)

#region FUNCIONALIDADES INIMIGO
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
			path_end();
		}
	}
}

function checar_player() {
	//Verifica se o jogador está dentro da área de perseguição do inimigo
	var _p = instance_nearest(x, y, obj_player);
	//Desenha uma linha do inimigo até o jogador mais próximo e verifica se ela colide em um colisor, retorna true ou false
	colision_line = collision_line(x, y, _p.x, _p.y, obj_colisor, true, false);
	
	//Verifica se o jogador mais próximo está na área de perigo do inimigo e se ele não está atrás de uma parede
	if distance_to_object(_p) <= dist_perigo and !colision_line {
		estado = inimigo_perseguir;
	}
}

function escolher_estado() {
	//Estado a ser executado pelo inimigo;
	prox_estado = choose(inimigo_andar, inimigo_parado);
	
	switch prox_estado {
		default: //Parado
			estado = inimigo_parado;
		break;
		case inimigo_andar: //Andar
			//Atualiza o estado do player para "andar" e define um ponto (x e y) aleatório da sala pra se locomover
			estado = inimigo_andar;
			
			var tam = obj_mapa.tam_cell; //Tamanho da célula
			dest_x = (irandom_range(0, room_width) div tam) * tam + tam/2;
			dest_y = (irandom_range(0, room_height) div tam) * tam + tam/2;
		break;
	}
}

#endregion FUNCIONALIDADES INIMIGO

#region ESTADOS INIMIGO
function inimigo_andar(){
	est = "andar"; //Valor de debug visual
	checar_player();
	image_speed = 1;
	
	if point_distance(x, y, dest_x, dest_y) > 2 {
		spd_inimigo();
		
		//var _p = instance_nearest(x, y, obj_player);
		//var tam = obj_mapa.tam_cell; //Tamanho da célula
	
		var x1 = x; //X inicial
		var y1 = y; //Y inicial
	
		spd_inimigo(); //Verificar movimentação
	
		dir = point_direction(x, y, dest_x, dest_y);
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
	
		//colisao_inimigo();
	
		//Caminho a ser seguido pelo inimigo
		if mp_grid_path(obj_mapa.grid_mapa,caminho,x1,y1,dest_x,dest_y,true) {
			path_start(caminho,spd,path_action_stop, false);
		}
		
	} else {
		path_end();
		x = dest_x;
		y = dest_y;
	}
}

function inimigo_parado() {
	est = "parar"; //Valor de debug visual
	checar_player();
	
	image_speed = .8;
}

#region PERSEGUIÇÃO
function inimigo_perseguir() {
	dist_perigo = dist_perigo_perseg; //Aumentar o campo de visão para procurar o player
	dist_segura = dist_perigo + 40;
	est = "perseg"; //Valor de debug visual
	image_speed = 1.2; //Taxa de frames da animação do sprite
	
	var _p = instance_nearest(x, y, obj_player);
	var tam = obj_mapa.tam_cell; //Tamanho da célula
	
	var x1 = x; //X inicial
	var y1 = y; //Y inicial
	dest_x = (_p.x div tam) * tam + tam/2; //Destino x do inimigo (player x)
	dest_y = (_p.y div tam) * tam + tam/2; //Destino y do inimigo (player y)
	
	spd_inimigo(); //Verificar movimentação
	
	dir = point_direction(x, y, dest_x, dest_y);
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);
	
	//colisao_inimigo();
	
	//Caminho a ser seguido pelo inimigo
	if mp_grid_path(obj_mapa.grid_mapa,caminho,x1,y1,dest_x,dest_y,true) {
		path_start(caminho,spd,path_action_stop, false);
	}
	
	//EMPURRÃO
	if hit == true {
		path_end();
		knockback_spd = lerp(knockback_spd, 0, .15);
	
		hspd = lengthdir_x(knockback_spd, knockback_dir);
		vspd = lengthdir_y(knockback_spd, knockback_dir);
		
		if !place_meeting(x, y, obj_colisor) {
			colisao_inimigo();
		}
	}
	////////////////////
	
	colision_line = collision_line(x, y, _p.x, _p.y, obj_colisor, true, false);	
	
	if distance_to_object(_p) > dist_segura or colision_line {
		estado = pos_inimigo_perseg;
	}
	
	alarm[0] = irandom_range(80, 300);
}

function pos_inimigo_perseg() {
	est = "pos-perseg"; //Valor de debug visual
	checar_player();
	if point_distance(x, y, dest_x, dest_y) <= 2 {
		x = dest_x;
		y = dest_y;
	}
	
	if x != dest_x and y != dest_y {
	//if point_distance(x, y, dest_x, dest_y) > 2 {
		alarm[0] = irandom_range(80, 300);
		
		spd_inimigo(); //Verificar movimentação
		
		//var _p = instance_nearest(x, y, obj_player);
		//var tam = obj_mapa.tam_cell; //Tamanho da célula
	
		var x1 = x; //X inicial
		var y1 = y; //Y inicial
	
		spd_inimigo(); //Verificar movimentação
	
		dir = point_direction(x, y, dest_x, dest_y);
		hspd = lengthdir_x(spd, dir);
		vspd = lengthdir_y(spd, dir);
	
		//colisao_inimigo();
	
		//Caminho a ser seguido pelo inimigo
		if mp_grid_path(obj_mapa.grid_mapa,caminho,x1,y1,dest_x,dest_y,true) {
			path_start(caminho,spd,path_action_stop, false);
		}
		
	} else {
		path_end();
		estado = inimigo_parado;
		alarm[0] = irandom_range(80, 300);
	}
}
#endregion PERSEGUIÇÃO

#endregion ESTADOS INIMIGO