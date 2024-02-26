//Definir as teclas das 4 direções
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));

//tecla de ataque específica
ataque = keyboard_check(ord("T"));

//ifs aninhados para mudança de sprite dependendo da direção do jogador
if(ataque = true && cima = true){
	sprite_index = ataqueup_joaspr;
} else if (ataque = true && baixo = true) {
		sprite_index = ataquedown_joaspr;
} else if (ataque = true && esquerda = true){
	image_index = -1;
	sprite_index = ataque_joaspr;
} else if (ataque = true && direita = true){
		sprite_index= ataque_joaspr;
} else{
	sprite_index = default_joaspr;	
}

// vida
if (hp_atual <= 0) {
    // Se a vida do jogador for menor ou igual a zero, o jogador morreu
    instance_destroy(); // Destruir o objeto do jogador ou executar alguma outra ação de morte
}

// Exemplo de uma condição para perder vida (por exemplo, se o jogador colidir com um inimigo)
if (place_meeting(x, y, obj_enemy)) {
    hp_atual -= 10; // Perde 10 de vida se colidir com um inimigo (ajuste conforme necessário)
}