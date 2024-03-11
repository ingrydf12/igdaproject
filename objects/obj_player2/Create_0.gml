/// @description Insert description here
event_inherited();

wspd = 8; //walk speed

if global.modo_jogo == "ARENA" {
	knockback_spd = 24;
	knockback_resistence = 3.5;
	hp_max = 85; // Define a vida máxima do jogador
	hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente
} else {
	knockback_spd = 24;
	knockback_resistence = 8.5;
	hp_max = 85; // Define a vida máxima do jogador
	hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente
}

tecla_atk = "L";