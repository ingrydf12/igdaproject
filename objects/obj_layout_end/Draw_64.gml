// @ingryd"
draw_set_font(fontend)
switch vencedor {
	default:
		draw_text(540,260,"PLAYER 1 VENCEU");
		break;
	case 2:
		draw_text(540,260,"PLAYER 2 VENCEU");
		break;
	case 3:
		draw_text(540,260,"PLAYER 3 VENCEU");
		break;
}
		
//contagem de vitórias de cada jogador
draw_text(550,350,"WINS P1 = " + string(global.p1_win))
draw_text(550,400,"WINS P2 = " + string(global.p2_win))

if global.player_quantia = 3 {
draw_text(550,450,"WINS P3 = "+ string(global.p3_win))
}

draw_set_font(-1);