/// @description Insert description here
var rh = room_height;
var rw = room_width;

if keyboard_check(vk_lcontrol) and keyboard_check_released(vk_backspace) {
	global.debug = !global.debug;
}

if global.debug {
	if keyboard_check_pressed(ord("R")) {game_restart()}
	if keyboard_check(vk_lcontrol) and keyboard_check_pressed(vk_add) {
		var _p = show_question("Qual player? (1 = Yes/2 = No)");
		switch _p {
			default:
				show_message("Esse player não existe!");
			break;
			case 1:
				instance_create_layer(rw/2, rh/2, layer, obj_player1)
			break;
			case 0:
				instance_create_layer(rw/2, rh/2, layer, obj_player2)
			break;
		}
		_p = -1;
	}
}