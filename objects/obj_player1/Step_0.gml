//Definir as teclas das 4 direções
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));

dano = irandom_range(20, 28);

event_inherited();