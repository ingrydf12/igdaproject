// @ingryd" 
var larg_spr = sprite_get_width(seljuknight)
var larg_spr2 = sprite_get_width(selkaburai)
var alt_spr = sprite_get_height(seljuknight)
var alt_spr2 = sprite_get_height(selkaburai)

var gw = display_get_gui_width();
var gh = display_get_gui_height();

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

draw_sprite_ext(seljuknight, 0, gw/2 - larg_spr/2, gh/2 , 1, 1, 0, c_white, 1)
draw_sprite_ext(selkaburai, 0, gw/2 + larg_spr2/2, gh/2 , 1, 1, 0, c_white, 1)


for(var p = 0; p < 2; p++){
    //p1
    if (point_in_rectangle(mx,my, gw, gh, larg_spr, alt_spr)){
    global.player1 = 1;
    }
}