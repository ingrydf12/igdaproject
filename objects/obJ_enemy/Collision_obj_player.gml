/// @description Insert description here
if other.hit == false {
	other.exe_knockback_dir = point_direction(other.x, other.y, x, y);
	other.knockback_spd = exe_knockback_spd;
	
	hp_atual -= irandom_range(8, 15); // Perde vida se colidir com um inimigo
	hit = true;
	alarm[0] = 24;
}