// @ingryd" 

var players = instance_number(obj_player);

if players == 1 {
    //encontra id de cada jogador
    var player1 = instance_find(obj_player1, 0);
    var player2 = instance_find(obj_player2, 1);
    var player3 = instance_find(obj_player3, 2);
    
	p1 = player1 != noone;
	p2 = player2 != noone;
	p3 = player3 != noone;
	
	switch (true) {
    case (p1):
		show_message("O jogador 1 está sozinho na sala.");
        global.p1_win += 1;
        //draw_sprite(slayoutend,sprite_index, 704, 384) // Desenha o sprite no layoutend
		//draw_set_font(fontmenu);
        //draw_text(room_width/2,room_height/2 , "PLAYER 1 Venceu!"); // Adiciona o texto centralizado
        break;
        
    case (p2):
        show_message("O jogador 2 está sozinho na sala.");
        global.p2_win += 1;
        break;
        
    case (p3):
        show_message("O jogador 3 está sozinho na sala.");
        global.p3_win += 1;
        break;
        
    default:
        show_message("Nenhum jogador identificado.");
        break;
}

	if (players < 1) {
    show_message("Empate.");
	}
}