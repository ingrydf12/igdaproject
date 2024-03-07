/// @description Insert description here
randomize();

global.wave = 1;
timer = -1; //tempo
spawn = true; //variável para controlar se o inimigo vai spawnar ou não

array_waves = [
	5, //wave 1
	7, //wave 2
	9, //wave 3
	2, //wave 4
	2, //wave 5
	1, //wave 6
	1, //wave 7
	1, //wave 8
	1, //wave 9
	1, //wave 10
	1, //wave 11
	1, //wave 12
	1, //wave 13
	1, //wave 14
	100 //wave 15
]

inimigo_obj = obj_enemy; //inimigo a ser spawnado
global.inimigos = array_waves[0]; //inimigos máximos na wave
global.inimigos_restantes = global.inimigos; //inimigos restantes

acao = decisao_spawn; //acao a ser executada