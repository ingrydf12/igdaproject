global.player_selector = 1;
//players = array_create(0);

image_speed = 0;

switch id_personagem {
	default:
		sprite_index = seljuknight;
		break;
	case 2:
		sprite_index = selkaburai;
		break;
	case 3:
		sprite_index = selpotonormal;
		break;
}
/*
====================================================@luska:
 Usar 'global.player1' para se referir ao Personagem escolhido pelo player 1
  'global.player2' para o Persongem do player 2 e 'global.player3' para o player 3

	Valores de acordo com os Personagens Selecionados:
	-Joaninha = 1      
	-Poto = 2
	-Kabuto = 3
==========================================================
*/