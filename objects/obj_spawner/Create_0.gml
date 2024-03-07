/// @description Insert description here
randomize();

global.wave = 1;
timer = -1; //tempo
spawn = true; //variável para controlar se o inimigo vai spawnar ou não

array_waves = [
	5, //wave 1
	7, //wave 2
	9, //wave 3
	13, //wave 4
	17, //wave 5
	21, //wave 6
	25, //wave 7
	29, //wave 8
	33, //wave 9
	37, //wave 10
	41, //wave 11
	45, //wave 12
	49, //wave 13
	53, //wave 14
	100 //wave 15
]

inimigo_obj = obj_enemy; //inimigo a ser spawnado
global.inimigos = array_waves[0]; //inimigos máximos na wave
global.inimigos_restantes = global.inimigos; //inimigos restantes

acao = decisao_spawn; //acao a ser executada