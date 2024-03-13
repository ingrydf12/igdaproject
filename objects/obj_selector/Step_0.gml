// identificação do mouse na room

var identificarMouse = position_meeting(mouse_x, mouse_y, id) //identifica o mouse sobre os icones
var mouseClick = mouse_check_button_pressed(mb_left) //identifica se houve o click do mouse

//identificar mouse sobre os personagens
if identificarMouse {
	image_speed = 1;
	switch(player){
		case 1: sprite_index = lerp(seljuknighthigh, 1, .1) //animação gradual para o sprite high JUK
		case 2: sprite_index = lerp(selkaburaihigh, 1, .1) // animação gradual para o sprite high KAB
	}
}