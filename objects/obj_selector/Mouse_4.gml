/// @description DESCRIÇÃO FODA

switch global.player_selector {
	default:
		global.player1 = id_personagem;
		break;
	case 2:
		global.player2 = id_personagem;
		break;
	case 3:
		global.player3 = id_personagem;
		break;
}

if global.player_selector >= 3 {
	if global.modo_jogo == "ARENA" {
		room_goto(rarena);
	} else {
		room_goto(rinicio);
	}
}

global.player_selector++;