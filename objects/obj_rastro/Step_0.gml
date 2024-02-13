//Diminuir alpha até sumir, após sumir por completo destruir o obj
image_alpha -= .08;

if image_alpha <= 0 {
	instance_destroy();
}