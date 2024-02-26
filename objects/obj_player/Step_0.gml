/// @description Insert description here
script_execute(estado);

if hp_atual <= 0 { // Se a vida do jogador for menor ou igual a zero, o jogador morreu
	instance_destroy(); // Destruir o objeto do jogador ou executar alguma outra ação de morte
}