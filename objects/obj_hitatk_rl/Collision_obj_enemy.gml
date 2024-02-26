/// @description Insert description here
if other.hit == false {
	//other.estado = inimigo_golpeado;
	other.knockback_dir = point_direction(jogador_id.x, jogador_id.y, other.x, other.y);
	other.knockback_spd = 6;
	
	other.vida_atual -= irandom_range(10, 25);
	other.hit = true;
	other.alarm[1] = 20;
}