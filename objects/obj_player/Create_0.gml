#region VARIÁVEIS INDEPENDENTES
//controles iniciais
direita = -1;
esquerda = -1;
cima = -1;
baixo = -1;

hspd = -1; //horizontal speed
vspd = -1; //vertical speed
dir = -1; //direção de movimentação
estado = andar; //estado de ação do player (andar, colidir, atacar...)

p_knockback_dir = -1; //Direção do knockback contra um player
p_knockback_spd = -1; //Força do knockback contra o player
imune = false; //Variável que deixa o player imune
imune_time = 180; //Quanto tempo o player fica imune
hit = false; //verificar se foi acertado pelo inimigo
dir_atk = -1; //Direção (em 4 quadrantes) do ataque do player
ataque = false; //Variável que verifica se o player atacou ou não
img_number_atk = 1;
#endregion VARIÁVEIS INDEPENDENTES

#region DADOS SEM GRID
/*
hp_max = 100; // Define a vida máxima do jogador
hp_atual = hp_max; // Define a vida atual do jogador como a vida máxima inicialmente
dano = irandom_range(15, 25);
wspd = 8; //walk speed
spd = wspd; //velocidade de mov
knockback_spd = 20;
knockback_resistence = 4;
tecla_atk = "";
*/
#endregion DADOS SEM GRIDo

#region DADOS POR GRID
var id_p = id_player - 1; //Id do player menos 1
var grid = global.grid_players; //Variável local da grid global

hp_max = grid[# Player.Vida, id_p]; //Vida máxima
hp_atual = hp_max; //Vida
wspd = grid[# Player.Speed, id_p]; //Walk Speed
spd = wspd; //Speed
dano_min = grid[# Player.DanoMin, id_p]; //Dano Mínimo
dano_max = grid[# Player.DanoMax, id_p]; //Dano Máximo
dano = irandom_range(dano_min, dano_max);
knockback_spd = grid[# Player.KB, id_p]; //Força de Knockback
knockback_resistence = grid[# Player.RKB, id_p]; //Resistência a Knockback
sprite_index = grid[# Player.Sprite, id_p];
#endregion DADOS POR GRID