/// @description Insert description here
randomize();

global.wave = 0;
timer = -1; //tempo
spawn = true; //variável para controlar se o inimigo vai spawnar ou não

inimigo_obj = obj_enemy; //inimigo a ser spawnado
global.inimigos = 10; //inimigos máximos na wave
global.inimigos_restantes = 0; //inimigos restantes

acao = decisao_spawn; //acao a ser executada