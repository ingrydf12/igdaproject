/// @description Criação Base
randomize();

#region MOVIMENTAÇÂO//////////////
wspd = 4; //walk speed
spd = wspd; //speed
hspd = -1; //horizontal speed
vspd = -1 //vertical speed
dir = -1; //direção de movimento

dest_x = -1; //ponto x de destino
dest_y = -1; //ponto y de destino
#endregion MOVIMENTAÇÂO//////////////

#region MP_GRID (IA DE CAMINHO)
caminho = path_add();
#endregion MP_GRID (IA DE CAMINHO)

#region STATE MACHINE///////////////
alarm[0] = 1;
estado = escolher_estado; //estado do inimigo (andando, parado, ataque...)
prox_estado = -1; //próximo estado a ser executado
est = -1; //dado para debug visual

dist_perigo_perseg = 380; //distância para perseguir jogador caso já tenha o visto
dist_perigo_inicial = 200; //distância para perseguir jogador padrão

dist_perigo = dist_perigo_inicial; 
dist_segura = dist_perigo + 40; //distância para esquecer do jogador

colision_line = -1;
#endregion STATE MACHINE///////////////

//STATUS
hit = false;
vida_maxima = 100;
vida_atual = vida_maxima; //vida inicial

//empurrão DO player
knockback_dir = -1; //direção do knockback
knockback_spd = -1; //força do knockback
knockback_resistence = 4; //resistência ao knockback

//empurrão AO player
p_knockback_spd = 24; //força do knockback