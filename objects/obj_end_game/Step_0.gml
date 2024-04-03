// @ingryd" 

var players = instance_number(obj_player);

if players == 1 {
    //encontra id de cada jogador
    var player1 = instance_find(obj_player1, 0);
    var player2 = instance_find(obj_player2, 1);
    var player3 = instance_find(obj_player3, 2);
    
if (player1 != noone) {
        show_message("O jogador 1 está sozinho na sala.");
    } else if (player2 != noone) {
        show_message("O jogador 2 está sozinho na sala.");
    } else if (player3 != noone) {
        show_message("O jogador 3 está sozinho na sala.");
    } else {
        show_message("Nenhum jogador identificado.");
    }
	
} else if(players < 1) {
    show_message("Empate.");
	}