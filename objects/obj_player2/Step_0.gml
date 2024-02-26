//Definir as teclas das 4 direções
cima = keyboard_check(vk_up);
baixo = keyboard_check(vk_down);
esquerda = keyboard_check(vk_left);
direita = keyboard_check(vk_right);

if (hp_atual <= 0) {
    // Se a vida do jogador for menor ou igual a zero, o jogador morreu
    instance_destroy(); // Destruir o objeto do jogador ou executar alguma outra ação de morte
}

// Inherit the parent event
event_inherited();