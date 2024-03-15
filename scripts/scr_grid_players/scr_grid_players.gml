//Adicionar um novo player à planilha
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
	///@arg sprite
	
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