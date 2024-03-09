var obj_x = obj_mode_arena.x;
var obj_y = obj_mode_arena.y;
var sw = sprite_get_width(sbutton_arena);
var sh = sprite_get_height(sbutton_arena);

if point_in_rectangle(mouse_x, mouse_y, obj_x - sw / 2, obj_y - sh / 2, obj_x + sw / 2, obj_y + sh / 2) {
	image_index = 1;
	
if mouse_check_button_pressed(mb_left) {
            room_goto(rarena);
    }
	
} else {
	image_index = 0;
} 