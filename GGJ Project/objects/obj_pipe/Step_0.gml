/// @description Insert description here
// You can write your code in this editor


if place_meeting(x,y,obj_char)
{
	if keyboard_check(vk_space)
	{
		hp -= 10/fps;
	}
}


if hp <= 0
{
	for (var i = 0; i < instance_number(obj_polluted_water); i++)
	{
		var tile = instance_find(obj_polluted_water,i);
		if distance_to_object(tile) <= 512
		{
			tile.is_polluted = false;
		}
	}
	for (var i = 0; i < instance_number(obj_polluted_water_deep); i++)
	{
		var tile = instance_find(obj_polluted_water_deep,i);
		if distance_to_object(tile) <= 512
		{
			tile.is_polluted = false;
		}
	}
	for (var i = 0; i < instance_number(obj_oil); i++)
	{
		var tile = instance_find(obj_oil,i);
		if distance_to_object(tile) <= 512
		{
			tile.is_polluted = false;
		}
	}
	instance_destroy();
}