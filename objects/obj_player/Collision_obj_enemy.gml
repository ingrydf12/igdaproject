/// @description Insert description here
if imune == false {
	if hit == false {
		hit = true;
		spd = 0; //Resetar a speed após receber um golpe
		
		p_knockback_dir = point_direction(other.x, other.y, x, y);
		p_knockback_spd = other.p_knockback_spd - knockback_resistence;
	
		hp_atual -= irandom_range(8, 15); // Perde vida se colidir com um inimigo
		imune_time = 180;
		alarm[2] = 23;
		alarm[0] = 24;
	}
}