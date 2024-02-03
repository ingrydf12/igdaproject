var cima = keyboard_check(ord("W"));
var baixo = keyboard_check(ord("S"));
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));

var tecla = direita - esquerda != 0 || baixo - cima !=0;
//retorno
dir = point_direction(0,0, direita - esquerda, baixo - cima); 
hspd = lengthdir_x(velm * tecla, dir);
vspd = lengthdir_y(velm * tecla, dir);

x = x + hspd;
y = y + vspd;