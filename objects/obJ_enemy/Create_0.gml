/// @description Insert description here
randomize();

spd = 4;
hspd = -1;
vspd = -1

dir = -1;
dirspd = -1;

dest_x = -1;
dest_y = -1;

dist_perigo = 200;
dist_segura = 230;

//STATE MACHINE
alarm[0] = 1;
estado = escolher_estado;
prox_estado = -1;
est = -1;