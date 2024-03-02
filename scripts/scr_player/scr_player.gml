	///@description SCRIPT VOLTADO PARA MONTAR E DESENVOLVER O CONJUNTO DE AÇÕES/ESTADOS DOS PLAYER, ASSIM COMO SEUS COMPLEMENTOS (COLISÃO, ALTERNÂNCIA DE 'SPD'...)

#region COLISÃO
function colisao(){
	#region Colisão Horizontal
	//Colisão Horizontal (eixo x) do objeto -> Verifica se o objeto está a pelo menos 'hspd' (spd horizontal) de pixel do colisor
	if place_meeting(x + hspd, y, obj_colisor) {
		while !place_meeting(x + sign(hspd), y, obj_colisor) {
			x += sign(hspd);
		}
		
		hspd = 0;
	}
	
	x += hspd;
	#endregion Colisão Horizontal
	
	#region Colisão Vertical
	if place_meeting(x, y + vspd, obj_colisor) {
		while !place_meeting(x, y + sign(vspd), obj_colisor) {
			y += sign(vspd);
		}
		
		vspd = 0;
	}
	
	y += vspd;
	#endregion Colisão Vertical
}
#endregion COLISÃO

#region VERIFICAR VELOCIDADE
function spd_player() {
	//Verifica se o player está se movendo (horizontalmente ou verticalmente)
	if hspd != 0 or vspd != 0 {
		
		//Se estiver, verificar a 'spd' do jogador
		if spd < wspd {
			//Efeito de 'movimentação' -> Cria um rastro dando a ideia de movimento no objeto
			//Se for menor que o limite (walk speed), criar um rastro inicial (Efeito de 'movimentação')
			var _vulto = instance_create_layer(x, y, layer, obj_rastro);
			_vulto.image_alpha = .09;
			_vulto.sprite_index = sprite_index;
			//Verifica a porcentagem da 'spd' do player, e se for menor que 50% do limite (wspd/2), então apenas aumentar gradativamente a 'spd' do jogador
			if spd < wspd/4 {
				spd += .08;
			} else if spd < wspd/2 {
				spd += .2;
			} else {
				//Se a 'spd' estiver na metade do limite, criar um rastro mais visível
				_vulto = instance_create_layer(x, y, layer, obj_rastro);
				_vulto.image_alpha = .12;
				_vulto.sprite_index = sprite_index;
				spd += .4;
			}
			
		} else {
			//Se a 'spd' estiver no limite, criar um rastro altamente visível
			var _vulto = instance_create_layer(x, y, layer, obj_rastro);
			_vulto.image_alpha = .26;
			_vulto.sprite_index = sprite_index;
		}
	} else {
		//Se não estiver em movimento, zerar a 'spd'
		spd = 0;
	}
}
#endregion VERIFICAR VELOCIDADE

function andar() {
	
	//Verificar se está andando para alguma direção e dizer seu quadrante
	if direita {
		sprite_index = sjoa_idleright;
		dir_atk = 0;
	} else if cima {
		sprite_index = sjoa_idleup;
		dir_atk = 1;
	} else if esquerda {
		sprite_index = sjoa_idleleft;
		dir_atk = 2;
	} else if baixo {
		sprite_index = sjoa_idledown;
		dir_atk = 3;
	}
	
	//Direção do eixo (positivo ou negativo)
	hspd = direita - esquerda;
	vspd = baixo - cima;
	
	//Verificar se o player está se movendo
	spd_player();
	
	//Define uma direção mais precisa de onde o jogador está se movendo através de um plano cartesiano e vetores
	dir = point_direction(x, y, x + hspd, y + vspd);
	
	hspd = lengthdir_x(spd, dir);
	vspd = lengthdir_y(spd, dir);
	//Aqui termina o código de direção do jogador
	
	colisao();
	
	//Verificar tecla de ataque (tecla 'X' ou 'L')
	if keyboard_check_pressed(ord(tecla_atk)) and alarm[1] <= 0 {
		image_index = 0; //Resetar frame da animação
		
		//Mudar a sprite de acordo com a direção que o player está olhando
		switch dir_atk {
			case 0: //Direita
				sprite_index = sjoa_atkright;
			break;
			case 2: //Esquerda
				sprite_index = sjoa_atkleft;
			break;
			case 1: //Cima
				sprite_index = sjoa_atkup;
			break;
			case 3: //Baixo
				sprite_index = sjoa_atkdown;
			break;
		}
		
		//Mudar para o estado de atacar
		estado = atacar;
	}
}

function atacar() {
	if ataque == false {
		switch dir_atk {
			case 0: //Direita
				var _i = instance_create_layer(x + 40, y + 20, layer, obj_hitatk_rl);
				_i.p_id = self;
			break;
			case 2: //Esquerda
				_i = instance_create_layer(x - 40, y + 20, layer, obj_hitatk_rl);
				_i.p_id = self;
			break;
			case 1: //Cima
				_i = instance_create_layer(x, y - 40, layer, obj_hitatk_ud);
				_i.p_id = self;
			break;
			case 3: //Baixo
				_i = instance_create_layer(x, y + 60, layer, obj_hitatk_ud);
				_i.p_id = self;
			break;
		}
		
		ataque = true;
	}
	
	if fim_animacao() {
		//Mudar para o estado de andar
		estado = andar;
		switch dir_atk {
			case 0: //Direita
				sprite_index = sjoa_idleright;
			break;
			case 2: //Esquerda
				sprite_index = sjoa_idleleft;
			break;
			case 1: //Cima
				sprite_index = sjoa_idleup;
			break;
			case 3: //Baixo
				sprite_index = sjoa_idledown;
			break;
		}
		
		ataque = false;
	}
}