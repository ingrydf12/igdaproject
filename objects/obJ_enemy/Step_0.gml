/// @description Insert description here
if instance_exists(obj_player) {
	script_execute(estado);
}

if hp_atual <= 0 {
	global.inimigos_restantes--;
	instance_destroy();
}