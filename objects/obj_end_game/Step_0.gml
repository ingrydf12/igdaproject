// @ingryd" 

var players = instance_number(obj_player);

if players == 1 {
    //encontra id de cada jogador
    var player1 = instance_find(obj_player1, 0);
    var player2 = instance_find(obj_player2, 0);
    var player3 = instance_find(obj_player3, 0);
    
	p1 = player1 != noone;
	p2 = player2 != noone;
	p3 = player3 != noone;
	
	switch (true) {
    case (p1):
        global.p1_win += 1;
		instance_create_layer(704,384,"end", obj_layout_end)
		instance_destroy()
        break;
        
    case (p2):
        global.p2_win += 1;
		instance_create_layer(704,384,"end", obj_layout_end)
		instance_destroy()
		break;
        
    case (p3):
        global.p3_win += 1;
		instance_create_layer(704,384,"end", obj_layout_end)
		instance_destroy()
		break;
        
    default:
        show_message("Nenhum jogador identificado.");
        break;
}

	if (players < 1) {
    show_message("Empate.");
	}
}
