/// @description Insert description here
if !instance_exists(obj_player) or global.pause == true {
	exit;
}

script_execute(acao);

if timer > 0 {
	timer--;
} else {
	spawn = true;
}