//Definir as teclas das 4 direções
cima = keyboard_check(ord("Y")) || gamepad_button_check_pressed(0, gp_padu);
baixo = keyboard_check(ord("H")) || gamepad_button_check_pressed(0, gp_padd);
esquerda = keyboard_check(ord("G")) || gamepad_button_check_pressed(0, gp_padl);
direita = keyboard_check(ord("J")) || gamepad_button_check_pressed(0, gp_padr);
tecla_atk = keyboard_check_pressed(ord("K")) || gamepad_button_check_pressed(0, gp_face3);

// Inherit the parent event
event_inherited();

