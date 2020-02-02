/// @description Insert description here
// You can write your code in this editor

water_num = 0;
cleaned_num = 0;
water_num += instance_number(obj_polluted_water);
water_num += instance_number(obj_polluted_water_deep);
water_num += instance_number(obj_oil);

for (var i = 0; i<instance_number(obj_polluted_water); i++)
{
	if instance_find(obj_polluted_water,i).is_polluted == false
	{
		cleaned_num++;
	}
}
for (var i = 0; i<instance_number(obj_polluted_water_deep); i++)
{
	if instance_find(obj_polluted_water_deep,i).is_polluted == false
	{
		cleaned_num++;
	}
}
for (var i = 0; i<instance_number(obj_oil); i++)
{
	if instance_find(obj_oil,i).is_polluted == false
	{
		cleaned_num++;
	}
}


if percent >= 100
{
	room_goto_next();
}