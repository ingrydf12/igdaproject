//Definir as teclas das 4 direções
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));

// Exemplo de uma condição para perder vida
//if (place_meeting(x, y, obj_enemy)) {
//    hp_atual -= 10; // Perde 10 de vida se colidir com um inimigo
//} ----> Código (re)movido (Adicionado um evento de colisão (com o inimigo) no parent player)
event_inherited();