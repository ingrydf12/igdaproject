/// @description Insert description here
if !instance_exists(obj_player) {
	morreu = true;
} else {
	morreu = false;
}

if morreu == true {
	var rw = room_width;
	var rh = room_height;
	if point_in_rectangle(mouse_x, mouse_y, rw/2 - 150, rh/2 - 80, rw/2 + 150, rh/2 + 80) {
		if mouse_check_button_pressed(mb_left) {
			game_restart();
		}
	}
}