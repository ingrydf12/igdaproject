/// @description Insert description here
if hit == false {
	p_knockback_dir = point_direction(other.x, other.y, x, y);
	p_knockback_spd = other.p_knockback_spd;
	
	hp_atual -= irandom_range(8, 15); // Perde vida se colidir com um inimigo
	hit = true;
	alarm[0] = 24;
}