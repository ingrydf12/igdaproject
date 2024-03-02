/// Draw Event of obj_HUD
draw_set_font(fonthud); // Define a fonte padrão
draw_set_color(c_white); // Define a cor branca

var hud_x = display_get_gui_width() / 2;
var hud_y = display_get_gui_height() / 2;

draw_text(hud_x, hud_y, "Game Over"); // Desenha o texto "Game Over" no meio da tela
draw_text(hud_x, hud_y + 30, "Pressione Enter para reiniciar"); // Desenha instruções abaixo do texto principal