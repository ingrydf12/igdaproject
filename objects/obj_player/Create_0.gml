#region MOVIMENTAÇÃO ////////////////////////////////////
//controles iniciais
direita = -1;
esquerda = -1;
cima = -1;
baixo = -1;

hspd = -1; //horizontal speed
vspd = -1; //vertical speed

dir = -1; //direção de movimentação
wspd = 8; //walk speed
//sspd = 10; // sprint speed
spd = wspd; //velocidade de mov

#endregion MOVIMENTAÇÃO ///////////////////////////////

#region STATUS PLAYER //////////////////////////////////

estado = andar; //estado de ação do player (andar, colidir, atacar...)

hit = false; //verificar se foi acertado pelo inimigo
hp_max = 100; // Define a vida máxima do jogador
hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente

dir_atk = -1;
ataque = false;
tecla_atk = "";
#endregion STATUS PLAYER ///////////////////////////

//debug
global.debug = false;