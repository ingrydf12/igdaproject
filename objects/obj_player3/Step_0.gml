//controles
var cima = keyboard_check(ord("I"));
var baixo = keyboard_check(ord("K"));
var esquerda = keyboard_check(ord("J"));
var direita = keyboard_check(ord("L"));

var tecla = direita - esquerda != 0 || baixo - cima !=0;
//retorno
dir = point_direction(0,0, direita - esquerda, baixo - cima); 
hspd = lengthdir_x(spd * tecla, dir);
vspd = lengthdir_y(spd * tecla, dir);

x = x + hspd;
y = y + vspd;