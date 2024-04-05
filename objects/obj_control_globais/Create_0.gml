/// @description Insert description here
#region DEBUG
global.debug = false;
#endregion DEBUG

#region DADOS GLOBAIS
//Chamar as variáveis globais pela primeira vez
global.player1 = 1;
global.player2 = 2;
global.player3 = 3;

global.player_selector = 0;

global.p1_win = 0;
global.p2_win = 0;
global.p3_win = 0;
#endregion

global.gamepad_id = noone;

function gamepad_connect() {
  var gamepad_slots = gamepad_get_device_count();

  for (var i = 0; i < gamepad_slots; i++) {
    if gamepad_is_connected(i) {
      global.gamepad_id = i;
      return true;
    }
  }
  return false
}