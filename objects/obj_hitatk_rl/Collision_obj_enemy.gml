/// @description Insert description here
if other.hit == false {
	other.knockback_dir = point_direction(p_id.x, p_id.y, other.x, other.y);
	other.knockback_spd = p_id.knockback_spd;
	
	other.vida_atual -= p_id.dano;
	other.hit = true;
	other.alarm[1] = 20;
}