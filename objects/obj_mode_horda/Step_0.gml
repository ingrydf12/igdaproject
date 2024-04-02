var obj_x = 704;
var obj_y = 544;
var sw = sprite_get_width(sbutton_horda);
var sh = sprite_get_height(sbutton_horda);

if point_in_rectangle(mouse_x, mouse_y, obj_x - sw / 2, obj_y - sh / 2, obj_x + sw / 2, obj_y + sh / 2) {
	image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		global.modo_jogo = "HORDA";
		montar_grid_players();
		room_goto(rselector);
		//room_goto(rinicio);
	}
	
} else {
	image_index = 0;
} 