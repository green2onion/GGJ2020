/// @description Insert description here
// You can write your code in this editor

if hp <= 0
{
	is_polluted = false;
	hp = 0;
	if alarm <= 0
	{
		alarm[0] = 5 * fps;
	}
	
}

if hp < tempHP
{
	x = random_range(origin_x-5,origin_x+5);
	y = random_range(origin_y-5,origin_y+5);
	tempHP = hp;
}