/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
xSpeed = 0;
ySpeed = 0;
depth = -y;


if place_meeting(x,y,obj_polluted_water)
{
	if instance_place(x,y,obj_polluted_water).is_polluted 
	{
		mySpeed = shallow_polluted_speed;
		stamina -= 3/fps;
	}
	mySpeed = shallow_speed;
	stamina -= 2/fps;
}
if place_meeting(x,y,obj_polluted_water_deep)
{
	if instance_place(x,y,obj_polluted_water_deep).is_polluted 
	{
		mySpeed = deep_polluted_speed;
		stamina -= 6/fps;
	}
	mySpeed = deep_speed;
	stamina -= 5/fps;
}
if place_meeting(x,y,obj_oil)
{
	if instance_place(x,y,obj_oil).is_polluted && !is_underwater
	{
		mySpeed = deep_polluted_speed;
		stamina -= 20/fps;
	}
	mySpeed = deep_speed;
	stamina -= 5/fps;
}


var list_rock = ds_list_create();
instance_place_list(x,y,all,list_rock,false);
for (var i = 0; i < ds_list_size(list_rock); i++)
{
	var rock_name = object_get_name(list_rock[|i].object_index);
	if string_pos("obj_rock",rock_name) != 0
	{
		mySpeed = rock_speed;
		stamina += 30/fps;
		break;
	}

}





if stamina > 100
{
	stamina = 100;
}
if stamina < 0
{
	stamina = 0;
}


if keyboard_check(ord("A"))
{
	xSpeed = -mySpeed;
}
if keyboard_check(ord("D"))
{
	xSpeed = mySpeed;
}
if keyboard_check(ord("W"))
{
	ySpeed = -mySpeed;
}
if keyboard_check(ord("S"))
{
	ySpeed = mySpeed;
}
if ySpeed >= 0
{
	facing = "front";
}
else if ySpeed < 0
{
	facing = "back";
}
if xSpeed > 0
{
	facing = "right"
}
else if xSpeed < 0
{
	facing = "left"
}

switch (facing)
{
	case "front": sprite_index = spr_char_front; break;
	case "back": sprite_index = spr_char_back; break;
	case "left": sprite_index = spr_char_left; break;
	case "right": sprite_index = spr_char_right; break;
	default: sprite_index = spr_char_front; break;
}

var can_move = true;
for (i=1;i<=abs(ySpeed);i++)
{
	can_move = true;
	if(place_meeting(x,y+sign(ySpeed)*i, obj_collider))
	{
		can_move = false;
		
	}
	if (can_move)
	{
		y+=sign(ySpeed); 
	}
}
for (i=1;i<=abs(xSpeed);i++)
{
	can_move = true;
	if(place_meeting(x+sign(xSpeed)*i,y, obj_collider))
	{
		can_move = false;
		
	}
	if (can_move)
	{
		x+=sign(xSpeed);
	}
}


var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);
var cam_x = lerp(camera_get_view_x(view_camera[0]),x-cwidth/2,0.1);
var cam_y = lerp(camera_get_view_y(view_camera[0]),y-cheight/2,0.1);
camera_set_view_pos(view_camera[0],cam_x,cam_y);

is_underwater = keyboard_check(vk_lshift);
if is_underwater
{
	sprite_index = spr_bubbles;
	oxygen -= 5/fps;
}
else
{
	oxygen += 5/fps;
}
if oxygen <= 0
{
	oxygen = 0;
}
if oxygen >= 100
{
	oxygen = 100;
}

if keyboard_check(vk_space)
{
	if !is_underwater
	{
		var list = ds_list_create();
		with (obj_spray)
		{
			obj_spray.visible = true;
			var num = instance_place_list(x,y,all,list,false)
		}
		//var particle_system = part_system_create_layer("Instances",false);
		effect_create_below(ef_spark,x,y,2,c_white);
		
		
		for (var i = 0; i<num; i++)
		{
			if list[|i].object_index == obj_polluted_water ||list[|i].object_index == obj_polluted_water_deep
			{
				list[|i].is_polluted = false;
				list[|i].alarm[0] = 500*fps;
			}
			if list[|i].object_index == obj_oil 
			{
				list[|i].hp -= 20/fps;
			}	
			var rock_name_1 = object_get_name(list[|i].object_index);
			if string_pos("obj_rock",rock_name_1) != 0
			{
				list[|i].is_polluted = false;
			}
		}
		stamina -= 2/fps;
		ds_list_destroy(list);
	}
	
}
else
{
	obj_spray.visible = false;
}

if stamina <= 0
{
	room_goto(room_game_over);
}
