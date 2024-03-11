/// @description Insert description here
event_inherited();

wspd = 5.5; //walk speed

if global.modo_jogo == "ARENA" {
	knockback_spd = 39;
	knockback_resistence = 10;
	hp_max = 100; // Define a vida máxima do jogador
	hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente
} else {
	knockback_spd = 39;
	knockback_resistence = 10;
	hp_max = 100; // Define a vida máxima do jogador
	hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente
}

tecla_atk = "X";
