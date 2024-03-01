/// @description Insert description here
tam_cell = 16; //Tamanho da célula da grid
hcell = room_width div tam_cell; //Quantia de células na horizontal
vcell = room_height div tam_cell; //Quantia de células na vertical
grid_mapa = mp_grid_create(0, 0, hcell, vcell, tam_cell, tam_cell);
mp_grid_add_instances(grid_mapa, obj_colisor, true);