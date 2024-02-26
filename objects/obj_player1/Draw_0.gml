/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited(){
//(apenas para visualizar a vida)
draw_self(); // Desenhar o próprio jogador
draw_set_color(c_black);
draw_rectangle(x - 20, y + 30, x + 20, y + 35, false); // Barra de vida preta
draw_set_color(c_lime); // Cor verde para a barra de vida
draw_rectangle(x - 20, y + 30, x - 20 + (hp_atual / hp_max) * 40, y + 35, false); // Barra de vida verde	
}