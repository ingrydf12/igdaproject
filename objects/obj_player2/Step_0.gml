//Definir as teclas das 4 direções
cima = keyboard_check(vk_up);
baixo = keyboard_check(vk_down);
esquerda = keyboard_check(vk_left);
direita = keyboard_check(vk_right);

dano = irandom_range(8, 18);

event_inherited();