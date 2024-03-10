/// @description Insert description here
if global.pause == true {
	exit;
}

script_execute(estado);

//SISTEMA DE IMUNIDADE
if imune == true {
	//diminuir o timer de imunidade e quando chegar em 0 deixar
	imune_time--;
	if imune_time <= 0 {
		imune = false;
		hit = true;
		alarm[0] = 1;
	}
	
	//ficar alternando a variável 'hit'
	if alarm[0] <= 0 {
		alarm[0] = 18;
	}
	
}

if hp_atual <= 0 { // Se a vida do jogador for menor ou igual a zero, o jogador morreu
	instance_destroy(); // Destruir o objeto do jogador ou executar alguma outra ação de morte
	instance_create_layer(x, y, "HUD", obj_hud_restart); // Ativa o objeto obj_HUD
}