// Script assets have changed for v2.3.0 see
#region ANIMAÇÕES
//MUDAS SPRITES DO PLAYER DE ACORDO COM A AÇÃO DELE
function att_sprite_player(acao) {
	///@param {string} "ação" Ação a ser executada: Ataque; Andar; Idle
	switch acao {
		#region ATACAR
		case "ATAQUE":
			switch id_player { //Verificar qual player vai atacar baseado na tecla de ataque
				case 1: //Player 1 Ataque
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
				break;
				case 2: //Player 2 Ataque
					switch dir_atk {
						case 0: //Direita
							sprite_index = spoto_atkright;
						break;
						case 2: //Esquerda
							sprite_index = spoto_atkleft;
						break;
						case 1: //Cima
							sprite_index = spoto_atkup;
						break;
						case 3: //Baixo
							sprite_index = spoto_atkdown;
						break;
					};
				break;
				case 3: //Player 3 Ataque
					switch dir_atk {
						case 0: //Direita
							sprite_index = splayer3;
						break;
						case 2: //Esquerda
							sprite_index = splayer3;
						break;
						case 1: //Cima
							sprite_index = splayer3;
						break;
						case 3: //Baixo
							sprite_index = splayer3;
						break;
					};
				break;
			}
		break;
		#endregion ATACAR
		#region ANDAR
		case "ANDAR":
			switch id_player {
				case 1: //Player 1 Andar
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
				break;
				case 2: //Player 2 Andar
					//Verificar se está andando para alguma direção e dizer seu quadrante
					if direita {
						sprite_index = spoto_idleright;
						dir_atk = 0;
					} else if cima {
						sprite_index = spoto_idleup;
						dir_atk = 1;
					} else if esquerda {
						sprite_index = spoto_idleleft;
						dir_atk = 2;
					} else if baixo {
						sprite_index = spoto_idledown;
						dir_atk = 3;
					}
				break;
				case 3: //Player 3 Andar
					//Verificar se está andando para alguma direção e dizer seu quadrante
					if direita {
						sprite_index = splayer3;
						dir_atk = 0;
					} else if cima {
						sprite_index = splayer3;
						dir_atk = 1;
					} else if esquerda {
						sprite_index = splayer3;
						dir_atk = 2;
					} else if baixo {
						sprite_index = splayer3;
						dir_atk = 3;
					}
				break;
			}
		break;
		#endregion ANDAR
		#region IDLE
		case "IDLE":
			switch id_player { //Verificar qual player está atacando baseado na tecla de ataque
				case 1: //Player 1 Idle
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
				break;
				case 2: //Player 2 Idle
					switch dir_atk {
						case 0: //Direita
							sprite_index = spoto_idleright;
						break;
						case 2: //Esquerda
							sprite_index = spoto_idleleft;
						break;
						case 1: //Cima
							sprite_index = spoto_idleup;
						break;
						case 3: //Baixo
							sprite_index = spoto_idledown;
						break;
					}
				break;
				case 3: //Player 3 Idle
					switch dir_atk {
						case 0: //Direita
							sprite_index = splayer3;
						break;
						case 2: //Esquerda
							sprite_index = splayer3;
						break;
						case 1: //Cima
							sprite_index = splayer3;
						break;
						case 3: //Baixo
							sprite_index = splayer3;
						break;
					}
				break;
			}
		break;
		#endregion IDLE
	}
}

//Verificar fim de uma animação
function fim_animacao() {
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current framde value
	/// @param {real} <rate> -See Below-
	///		The rate of change in frames per step if not
	///		using built in image_index/image_speed.
	///		Don't use if you don't think you need this. You probably don't.
	
	//returns true if the animation will loop this step.
	
	//Script courtesy of PixellatedPope & Minty Python from GameMaker subreddit discord
	//https://www.reddit.com/r/gamemaker/wiki/discord
	
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if (_type == spritespeed_framespersecond)
		_spd = _spd/game_get_speed(gamespeed_fps);
		if(argument_count > 2) _spd = argument[2];
		return _image + _spd >= sprite_get_number(_sprite);
}
#endregion ANIMAÇÕES

#region WAVES
//WAVES INIMIGOS
function att_wave() {
	randomize();
	
	//if global.wave < 4 or global.wave >= 15 { //Waves de 1 a 3 e da 15 pra cima
	//	global.inimigos = array_waves[global.wave - 1];
	//	global.inimigos_restantes = global.inimigos;
	//} else { //Waves de 4 até 14
	//	global.inimigos = array_waves[2] + (global.wave - 3) * 4
	//	global.inimigos_restantes = global.inimigos;
	//}
	
	if global.wave < 15 {
		if global.wave < 4 {
			global.inimigos = 5 + (global.wave - 1) * 2;
			global.inimigos_restantes = global.inimigos;	
		} else {
			global.inimigos = 9 + ((global.wave - 3) * 4);
			global.inimigos_restantes = global.inimigos;	
		}
	} else {
		global.inimigos = 12 + ((global.wave - 3) * 4);
		global.inimigos_restantes = global.inimigos;
	}
	
	acao = decisao_spawn;
}

function decisao_spawn() {
	if spawn == true and global.inimigos > 0 {
		acao = inimigo_spawn;
	}
	
	if global.inimigos_restantes <= 0 {
		global.wave++;
		spawn = false;
		timer = 120;
		acao = att_wave;
	}
}
//SPAWNAR INIMIGO
function inimigo_spawn() {
	randomize();
	
	var a = [obj_spawn1, obj_spawn2, obj_spawn3];
	var i = irandom_range(0, array_length(a) - 1);
	
	//definir um x e y de spawn do inimigo
	var xx = a[i].x; //ponto x de spawn
	var yy = a[i].y; //ponto y de spawn
	
	var p = instance_nearest(xx, yy, obj_player); //jogador mais próximo
	
	//evitar spawnar muito próximo a um player
	if point_distance(xx, yy, p.x, p.y) <= 340 {
		exit;
	}
	
	spawn = false;
	timer = irandom_range(180, 300);
	global.inimigos--;
	
	instance_create_layer(xx, yy, "inimigos", inimigo_obj);
	
	acao = decisao_spawn;
}
#endregion WAVES