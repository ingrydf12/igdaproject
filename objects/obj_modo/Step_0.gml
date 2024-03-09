var obj_x = 672;
var obj_y = 576;
var sw = sprite_get_width(obj_modo);
var sh = sprite_get_height(obj_modo);

if point_in_rectangle(mouse_x, mouse_y, obj_x - sw / 2, obj_y - sh / 2, obj_x + sw / 2, obj_y + sh / 2) {
	//image_alpha = .8;
	//image_xscale = lerp(escala, escala*1.5, .5);
	//image_yscale = lerp(escala, escala*1.5, .5);
	image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		room_goto(rmodos);
	}
	
} else {
	//image_alpha = .6;
	//image_xscale = lerp(escala*2, escala, .5);
	//image_yscale = lerp(escala*2, escala, .5);
	
	image_index = 0;
}