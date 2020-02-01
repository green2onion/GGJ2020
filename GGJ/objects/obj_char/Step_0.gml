/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
xSpeed = 0;
ySpeed = 0;
depth = -y;


if place_meeting(x,y,obj_water_shallow)
{
	mySpeed = shallow_speed;
	stamina -= 2/fps;
}
if place_meeting(x,y,obj_water_deep)
{
	mySpeed = deep_speed;
	stamina -= 5/fps;
}
if place_meeting(x,y,obj_rock)
{
	mySpeed = rock_speed;
	stamina += 30/fps;
}

if stamina > 100
{
	stamina = 100;
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
	case "front": sprite_index = spr_char; break;
	//case "back": sprite_index = spr_broBack; break;
	//case "left": sprite_index = spr_broLeft; break;
	//case "right": sprite_index = spr_broRight; break;
	default: sprite_index = spr_char; break;
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




