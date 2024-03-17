/// @description Insert description here

if global.modo_jogo == "ARENA" {
	if p_id != other {
		if other.imune == false {
			if other.hit == false {
				other.hit = true;
				other.spd = 0; //Resetar a speed após receber um golpe
			
				other.p_knockback_dir = point_direction(other.x, other.y, p_id.x, p_id.y);
				other.p_knockback_spd = other.p_knockback_spd - p_id.knockback_resistence;
			
				other.hp_atual -= p_id.dano;
				other.imune_time = 90;
				other.alarm[2] = 23;
				other.alarm[0] = 24;
			}
		}
	}
}