// Script assets have changed for v2.3.0 see
//Verificar fim de uma animação
function fim_animacao(){
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current framde value
	/// @param {real} <rate> -See Below-
	///		The rate of change in frames per step if not
	///		using built in image_index/image_speed.
	///		Don't use if you don't think you need this. You probably don't.
	
	//returns true if the animation will loop this step.
	
	//Script courtesy of PixellatedPope & Minty Python from GameMaker subreddit discord
	//https://www.reddit.com/r/gamemaker/wiki/discord
	
	var _sprite = sprite_index;
	var _image = image_index;
	if(argument_count > 0) _sprite = argument[0];
	if(argument_count > 1) _image = argument[1];
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if (_type == spritespeed_framespersecond)
		_spd = _spd/game_get_speed(gamespeed_fps);
		if(argument_count > 2) _spd = argument[2];
		return _image + _spd >= sprite_get_number(_sprite);
}

//WAVES INIMIGOS
function att_wave() {
	randomize();
	
	switch global.wave {
		default:
			global.inimigos = 5;
			global.inimigos_restantes = global.inimigos;
		break;
	}
	
	acao = decisao_spawn;
}

function decisao_spawn() {
	if spawn == true and global.inimigos > 0 {
		acao = inimigo_spawn;
	}
	
	if global.inimigos_restantes <= 0 {
		global.wave++;
		spawn = false;
		timer = 120;
		acao = att_wave;
	}
}

function inimigo_spawn() {
	randomize();
	
	var a = [obj_spawn1, obj_spawn2, obj_spawn3];
	var i = irandom_range(0, array_length(a) - 1);
	
	//definir um x e y de spawn do inimigo
	var xx = a[i].x; //ponto x de spawn
	var yy = a[i].y; //ponto y de spawn
	
	var p = instance_nearest(xx, yy, obj_player); //jogador mais próximo
	
	//evitar spawnar muito próximo a um player
	if point_distance(xx, yy, p.x, p.y) <= 220 {
		exit;
	}
	
	spawn = false;
	timer = irandom_range(180, 300);
	global.inimigos--;
	
	instance_create_layer(xx, yy, "inimigos", inimigo_obj);
	
	acao = decisao_spawn;
}

function debug_wave(w, i, t) {
	///@param {real} Wave
	///@param {real} Inimigos
	///@param {real} Timer
	
	
}