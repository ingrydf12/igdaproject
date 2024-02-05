var cima = keyboard_check(vk_up);
var baixo = keyboard_check(vk_down);
var esquerda = keyboard_check(vk_left);
var direita = keyboard_check(vk_right);

var tecla = direita - esquerda != 0 || baixo - cima !=0;
//retorno
dir = point_direction(0,0, direita - esquerda, baixo - cima); 
hspd = lengthdir_x(velm * tecla, dir);
vspd = lengthdir_y(velm * tecla, dir);

x = x + hspd;
y = y + vspd;