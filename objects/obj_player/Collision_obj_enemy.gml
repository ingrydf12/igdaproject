/// @description Insert description here
if hit == false {
	hp_atual -= irandom_range(8, 15); // Perde 10 de vida se colidir com um inimigo
	hit = true;
	alarm[0] = 24;
}