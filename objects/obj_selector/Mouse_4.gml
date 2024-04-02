/// @description DESCRIÇÃO FODA

switch global.player_selector {
	default:
		global.player1 = id_personagem;
		//array_push(players, obj_player1);
		break;
	case 2:
		global.player2 = id_personagem;
		//array_push(players, obj_player2);
		break;
	case 3:
		global.player3 = id_personagem;
		//array_push(players, obj_player3);
		break;
}

if global.player_selector >= global.player_quantia {
	if global.modo_jogo == "ARENA" {
		room_goto(rarena);
	} else {
		room_goto(rinicio);
	}
}

global.player_selector++;