//Adicionar um novo player à planilha
function montar_grid_players() {
	#region Grid Players
	enum Player { //Lista dos valores que serão usados
		ID_player,
		Vida,
		Speed,
		DanoMin,
		DanoMax,
		KB,
		RKB,
		Tecla,
		Habilidade,
		Sprite,
		Largura
	}

	global.grid_players = ds_grid_create(Player.Largura, 0);

	switch global.modo_jogo {
		#region ARENA
		case "ARENA":
			ds_grid_add_player(1,	100, 5.5, 18, 27, 39, 10, keyboard_check_pressed(ord("X")), 0, sjoa_idledown); //Valores do Personagem 1
			ds_grid_add_player(2,	85, 8, 12, 22, 24, 3.5, mouse_check_button_pressed(mb_left), 0, skabuto_idledown); //Valores do Personagem 2
			ds_grid_add_player(3,	65, 12, 10, 18, 18, 2, keyboard_check_pressed(ord("K")), 0, spoto_idledown); //Valores do Personagem 3
		break;
		#endregion ARENA
	
		#region HORDA
		case "HORDA":
			ds_grid_add_player(1,	100, 5.5, 18, 27, 39, 10, "X", 0, sjoa_idledown); //Valores do Personagem 1
			ds_grid_add_player(2,	85, 8, 12, 22, 24, 8.5, "L", 0, spoto_idledown); //Valores do Personagem 2
			ds_grid_add_player(3,	75, 12, 10, 21, 18, 2, "V", 0, splayer3); //Valores do Personagem 3
		break;
		#endregion HORDA
	}
	#endregion Grid Players
}

function ds_grid_add_row() {
	///@arg ds_grid
	
	var _grid = argument[0];
	ds_grid_resize(_grid, ds_grid_width(_grid), ds_grid_height(_grid) + 1);
	return(ds_grid_height(_grid) - 1);
}


//Valores a serem adicionados na grid
function ds_grid_add_player() {
	///@arg1 player_id
	///@arg2 vida
	///@arg3 speed
	///@arg4 dano_min
	///@arg5 dano_max
	///@arg6 knockback
	///@arg7 resistência_knockback
	///@arg8 tecla_atk
	///@arg9 habilidade
	///@arg10 sprite
	
	var _grid = global.grid_players;
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0]; //ID do Player
	_grid[# 1, _y] = argument[1]; //Vida
	_grid[# 2, _y] = argument[2]; //Speed
	_grid[# 3, _y] = argument[3]; //Dano Mínimo
	_grid[# 4, _y] = argument[4]; //Dano Máximo
	_grid[# 5, _y] = argument[5]; //Knockback
	_grid[# 6, _y] = argument[6]; //Resistência a Knockback
	_grid[# 7, _y] = argument[7]; //Tecla de Ataque
	_grid[# 8, _y] = argument[8]; //Habilidade (0 para falso, e qualquer outro valor para true)
	_grid[# 9, _y] = argument[9]; //Sprite do Personagem
	
}