// @ingryd" 
var obj_x = 448
var obj_y = 512
var sw = sprite_get_width(sbtnmenu)
var sh = sprite_get_height(sbtnmenu)

if point_in_rectangle(mouse_x, mouse_y, obj_x - sw / 2, obj_y - sh / 2, obj_x + sw / 2, obj_y + sh / 2) {
	image_index = 0;
	
	if mouse_check_button_pressed(mb_left){
				if global.p1_win >= 1{
		global.p1_win = 1
		}
		
		if global.p2_win >= 1{
		global.p2_win = 1
		}
		
		if global.p3_win >= 1{
		global.p3_win = 1
		}
	room_restart();
	}
}else{
	image_index = 1	
}