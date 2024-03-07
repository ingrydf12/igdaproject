/// @description Insert description here
if !instance_exists(obj_player) {
	exit;
}

script_execute(acao);

if timer > 0 {
	timer--;
} else {
	spawn = true;
}