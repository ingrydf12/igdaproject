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
		
		////Se estiver, verificar a 'spd' do jogador
		//if spd < wspd {
		//	//Efeito de 'movimentação' -> Cria um rastro dando a ideia de movimento no objeto
		//	//Se for menor que o limite (walk speed), criar um rastro inicial (Efeito de 'movimentação')
		//	var _vulto = instance_create_layer(x, y, layer, obj_rastro);
		//	_vulto.image_alpha = .09;
		//	_vulto.sprite_index = sprite_index;
		//	//Verifica a porcentagem da 'spd' do player, e se for menor que 50% do limite (wspd/2), então apenas aumentar gradativamente a 'spd' do jogador
		//	if spd < wspd/2 {
		//		//Se a 'spd' estiver com menos da metade do limite, criar um rastro visível
		//		_vulto = instance_create_layer(x, y, layer, obj_rastro);
		//		_vulto.image_alpha = .12;
		//		_vulto.sprite_index = sprite_index;
		//		spd += .08;
		//	} else if spd < wspd/4 {
		//		spd = wspd/4;
		//	} else {
		//		//Se a 'spd' estiver na metade (ou mais) do limite, criar um rastro mais visível
		//		_vulto = instance_create_layer(x, y, layer, obj_rastro);
		//		_vulto.image_alpha = .18;
		//		_vulto.sprite_index = sprite_index;
		//		spd += .4;
		//	}
			
		//} else {
		//	//Se a 'spd' estiver no limite, criar um rastro altamente visível
		//	var _vulto = instance_create_layer(x, y, layer, obj_rastro);
		//	_vulto.image_alpha = .26;
		//	_vulto.sprite_index = sprite_index;
		//}
		var _vulto = instance_create_layer(x, y, layer, obj_rastro);
		_vulto.image_alpha = .26;
		_vulto.sprite_index = sprite_index;
		spd = wspd;
	} else {
		//Se não estiver em movimento, zerar a 'spd'
		spd = 0;
	}
}
#endregion VERIFICAR VELOCIDADE

function andar() {
	
	//Mudar sprite para andar
	att_sprite_player("ANDAR");
	
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
	
	//EMPURRÃO
	if hit == true and imune == false {
		p_knockback_spd = lerp(p_knockback_spd, 0, .15); //Força de knockback
	
		hspd = lengthdir_x(p_knockback_spd, p_knockback_dir);
		vspd = lengthdir_y(p_knockback_spd, p_knockback_dir);
		
		colisao();
	}
	////////////////////
	
	colisao();
	
	//Verificar tecla de ataque (tecla 'X' ou 'L')
	if tecla_atk and alarm[1] <= 0 {
		spd = 0; //Resetar a speed do player após bater
		image_index = 0; //Resetar frame da animação
		
		//Mudar a sprite, para ataque, de acordo com a direção que o player está olhando
		att_sprite_player("ATAQUE");
		
		//Mudar para o estado de atacar
		estado = atacar;
	}
}

function atacar() {
	if image_index >= img_number_atk { //Verificar se a imagem do sprite atual é a sprite de ataque para spawnar a hitbox
		if ataque == false {
			#region DETERMINAR X E Y DA HITBOX
			////Determinar X e Y (de distância) para surgir a hitbox de atk
			//var xde = 40;	//X Direita e Esquerda
			//var yde = 20;	//Y Direita e Esquerda
			//var yc = 40;	//Y Cima
			//var yb = 60;	//Y Baixo
			//switch id_player {
			//	case 1: //Personagem 1
			//		xde = 40;
			//		yde = 20;
			//		yc = 40;
			//		yb = 60;
			//	break;
			//	case 2: //Personagem 2
			//		xde = 40;
			//		yde = 10;
			//		yc = 40;
			//		yb = 60;
			//	break;
			//	case 3: //Personagem 3
			//		xde = 60;
			//		yde = 10;
			//		yc = 40;
			//		yb = 60;
			//	break;
			//}
			#endregion DETERMINAR X E Y DA HITBOX
			
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
			
			if image_index >= 2 {
				ataque = true;
			}
		}
	}
	
	if fim_animacao() {
		//Mudar para o estado de andar
		estado = andar;
		//Tempo para atacar novamente (em frames)
		switch id_player {
			case 1: //Player 1
				alarm[1] = 50;
			break;
			case 2: //Player 2
				alarm[1] = 15;
			break;
			case 3: //Player 3
				alarm[1] = 8;
			break;
		}
		
		//Retornar ao sprite de idle
		att_sprite_player("IDLE");
		
		ataque = false;
	}
}