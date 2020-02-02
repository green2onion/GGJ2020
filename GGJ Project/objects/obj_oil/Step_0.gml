/// @description Insert description here
// You can write your code in this editor

if hp <= 0
{
	is_polluted = false;
	hp = 0;
	var new_tile = instance_create_layer(x,y,"Terrain",obj_polluted_water);
		new_tile.is_polluted = false;
		new_tile.is_cured = true;
		instance_destroy();
	
}

if hp < tempHP
{
	x = random_range(origin_x-5,origin_x+5);
	y = random_range(origin_y-5,origin_y+5);
	tempHP = hp;
}