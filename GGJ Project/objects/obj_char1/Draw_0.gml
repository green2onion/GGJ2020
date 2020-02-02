/// @description Insert description here
// You can write your code in this editor
draw_self();
sprite_set_speed(sprite_index,mySpeed,spritespeed_framespersecond);
draw_healthbar(x-200, y-150, x+200, y-200,stamina,c_black,c_red,c_green,0,true,true);
if is_underwater
{
	draw_healthbar(x-200, y-250, x+200, y-300,oxygen,c_black,c_blue,c_yellow,0,true,true);
}
