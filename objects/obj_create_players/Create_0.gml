switch global.player_quantia {
	default:
		instance_create_layer(room_width/2,room_height/2,"variaveis",obj_player1);
		break;
	case 2:
		instance_create_layer(room_width/2 - 50,room_height/2,"variaveis",obj_player1);
		instance_create_layer(room_width/2 + 50,room_height/2,"variaveis",obj_player2);
		break;
	case 3:
		instance_create_layer(room_width/2 - 50,room_height/2,"variaveis",obj_player1);
		instance_create_layer(room_width/2 + 50,room_height/2,"variaveis",obj_player2);
		instance_create_layer(room_width/2,room_height/2 + 50,"variaveis",obj_player3);
		break;
}