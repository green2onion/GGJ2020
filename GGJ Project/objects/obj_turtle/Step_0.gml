/// @description Insert description here
// You can write your code in this editor



if is_saved
{
	sprite_index = spr_turtle;
	if alarm[0] <= 0
	{
		alarm[0] = 5*fps;
	}
	
	var list = ds_list_create();
	var num = instance_place_list(x,y,all,list,false)

	for (var i = 0; i<num; i++)
	{
		if list[|i].object_index == obj_polluted_water ||list[|i].object_index == obj_polluted_water_deep
		{
			list[|i].is_polluted = false;
			list[|i].alarm[0] = 10*fps;
		}
	}
	ds_list_destroy(list);
}
else
{
	if place_meeting(x,y,obj_char)
	{
		if keyboard_check(vk_space)
		{
			is_saved = true;
			move_towards_point(random_range(0,room_width),random_range(0,room_height),2);
		}
	}
}
