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

#region STATE MACHINE///////////////
alarm[0] = 1;
estado = escolher_estado; //estado do inimigo (andando, parado, ataque...)
prox_estado = -1; //próximo estado a ser executado
est = -1; //dado para debug visual

dist_perigo = 200; //distância para perseguir jogador
dist_segura = 230; //distância para esquecer do jogador
#endregion STATE MACHINE///////////////

//STATUS
vida_maxima = 5;
vida = vida_maxima; //vida inicial