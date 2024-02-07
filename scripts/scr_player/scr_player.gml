function colisao(){
    if place_meeting(x + hspd, y, obj_colisor) {
        while !place_meeting(x + sign(hspd), y, obj_colisor) {
            x += sign(hspd);
        }
        
        hspd = 0;
    }
    
    x += hspd;
    
    if place_meeting(x, y + vspd, obj_colisor) {
        while !place_meeting(x, y + sign(vspd), obj_colisor) {
            y += sign(vspd);
        }
        
        vspd = 0;
    }
    
    y += vspd;
}

function andar() {
    cima = keyboard_check(ord("W"));
    baixo = keyboard_check(ord("S"));
    esquerda = keyboard_check(ord("A"));
    direita = keyboard_check(ord("D"));

    hspd = direita - esquerda;
    vspd = baixo - cima;


    //retorno
    if hspd != 0 or vspd != 0 {
        if velm < 10 {
            velm += .4;
        }
    } else {
        velm = 0;
    }
    
    dirspd = point_direction(x, y, x + hspd, y + vspd);
    
    hspd = lengthdir_x(velm, dirspd);
    vspd = lengthdir_y(velm, dirspd);
        
    colisao();
}