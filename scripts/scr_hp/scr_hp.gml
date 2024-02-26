// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hp(){
	// Create Event
hp_max = 100; // Define a vida máxima do jogador
hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente

// Step Event (pode ser o Step Normal)
// Exemplo básico de redução de vida
if (hp_atual <= 0) {
    // Se a vida do jogador for menor ou igual a zero, o jogador morreu
    instance_destroy(); // Destruir o objeto do jogador ou executar alguma outra ação de morte
}

// Exemplo de uma condição para perder vida (por exemplo, se o jogador colidir com um inimigo)
if (place_meeting(x, y, obj_enemy)) {
    hp_atual -= 10; // Perde 10 de vida se colidir com um inimigo (ajuste conforme necessário)
}

// Draw Event (opcional - apenas para visualizar a vida)
draw_self(); // Desenhar o próprio jogador
draw_set_color(c_black);
draw_rectangle(x - 20, y + 30, x + 20, y + 35, false); // Barra de vida preta
draw_set_color(c_lime); // Cor verde para a barra de vida
draw_rectangle(x - 20, y + 30, x - 20 + (hp_atual / hp_max) * 40, y + 35, false); // Barra de vida verde

}