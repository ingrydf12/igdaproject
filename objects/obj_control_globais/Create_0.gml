/// @description Insert description here
#region DEBUG
global.debug = false;
#endregion DEBUG

#region Grid Players
global.player1 = 1;
global.player2 = 2;
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
		
		ds_grid_add_player(1,	100, 5.5, 18, 27, 39, 10, "X", 0, sjoa_idledown); //Player 1
		ds_grid_add_player(2,	85, 8, 12, 22, 24, 3.5, "L", 0, spoto_idledown); //Player 2
		//ds_grid_add_player(3,	75, 12, 10, 21, 18, 2, "V", 0); //Player 3
	break;
	#endregion ARENA
	
	#region HORDA
	case "HORDA":
		ds_grid_add_player(1,	100, 5.5, 18, 27, 39, 10, "X", 0, sjoa_idledown); //Player 1
		ds_grid_add_player(2,	85, 8, 12, 22, 24, 8.5, "L", 0, spoto_idledown); //Player 2
		//ds_grid_add_player(3,	75, 12, 10, 21, 18, 2, "V", 0); //Player 3
	break;
	#endregion HORDA
}
#endregion Grid Players