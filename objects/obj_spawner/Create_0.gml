/// @description Insert description here
randomize();

global.wave = 1; //wave atual
timer = -1; //tempo para spawn
spawn = true; //variável para controlar se o inimigo vai spawnar ou não

inimigo_obj = obj_enemy; //inimigo a ser spawnado
global.inimigos = 5; //inimigos máximos na wave
global.inimigos_restantes = global.inimigos; //inimigos restantes

att_wave();

acao = decisao_spawn; //acao a ser executada