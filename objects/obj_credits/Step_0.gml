// @ingryd" 
var obj_x = 684;
var obj_y= 576;
var sw = sprite_get_width(sbutton_credits)
var sh = sprite_get_height(sbutton_credits)

if point_in_rectangle(mouse_x, mouse_y, obj_x - sw / 2, obj_y - sh / 2, obj_x + sw / 2, obj_y + sh / 2) {
	image_index = 1;
	
	if mouse_check_button_pressed(mb_left){
		audio_play_sound(sclick,1,false)
		room_goto(rcredits);
	}
	
} else {
	image_index = 0;
}