//Definir as teclas das 4 direções
cima = keyboard_check(ord("Y"));
baixo = keyboard_check(ord("H"));
esquerda = keyboard_check(ord("G"));
direita = keyboard_check(ord("J"));
tecla_atk = keyboard_check_pressed(ord("K"));

// Inherit the parent event
event_inherited();

