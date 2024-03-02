/// @description Insert description here
if other.hit == false {
	other.knockback_dir = point_direction(p_id.x, p_id.y, other.x, other.y);
	other.knockback_spd = 20;
	
	other.vida_atual -= irandom_range(10, 25);
	other.hit = true;
	other.alarm[1] = 20;
}