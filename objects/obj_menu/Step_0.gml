/// @description Insert description here
var rw = room_width;
var rh = room_height;
var sw = sprite_get_width(sbutton_play) * escala;
var sh = sprite_get_height(sbutton_play) * escala;

if point_in_rectangle(mouse_x, mouse_y, rw/2 - sw/2, rh/2 - sh/2, rw/2 + sw/2, rh/2 + sh/2) {
	//image_alpha = .5;
	image_xscale = lerp(escala, escala*1.5, .5);
	image_yscale = lerp(escala, escala*1.5, .5);
	image_index = 1;
	
	if mouse_check_button_pressed(mb_left) {
		room_goto(rmodos);
	}
	
} else {
	//image_alpha = .3;
	image_xscale = lerp(escala*2, escala, .5);
	image_yscale = lerp(escala*2, escala, .5);
	
	image_index = 0;
}