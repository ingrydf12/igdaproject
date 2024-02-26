/// @description Insert description here
if keyboard_check(vk_lcontrol) and keyboard_check_released(vk_backspace) {
	global.debug = !global.debug;
}