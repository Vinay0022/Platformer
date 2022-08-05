//Get player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_attack = mouse_check_button(mb_left);

//Calculate Movement
var move = key_right -key_left;

hsp = move * walksp;

vsp = vsp + grv;

if(place_meeting(x,y+1,oWall)) && (key_jump)
{ 

vsp=-7;

}

//Horizontal Collision
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x+sign(hsp);
	}
hsp =0;

}
x = x + hsp;

//Vertical Collision
if(place_meeting(x,y+vsp,oWall))
{
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y+sign(vsp);
	}
vsp =0;

}
y = y + vsp;


//Animation
if(!place_meeting(x,y+1,oWall))
{
sprite_index = sPlayerA;
image_speed=0;
if(sign(vsp)<0) image_index = 1;
}	
else
{
image_speed =1;
if(hsp==0)
{
sprite_index =sPlayer;	
}
else
{
sprite_index = sPlayerR;
}
}
if(hsp!=0)image_xscale = sign(hsp);

// Create Bullet and Muzzle

// Create Bullet and Muzzle
firingdelay = firingdelay - 1;
if (mouse_check_button(mb_left)) && (firingdelay < 0)
{ 
    firingdelay = 5;
    {
var direction_Padding_X = 0; var scale = 1; var direction_ = 0;
if (image_xscale == 1) {direction_Padding_X = 10; scale = 1; var direction_ = 0;}
if (image_xscale == -1) {direction_Padding_X = -10; scale = -1; var direction_ = 180;}

var muzzle = instance_create_layer(x + direction_Padding_X, y -6, "Bullet", oMuzzle);
muzzle.buffer_X = direction_Padding_X;
muzzle.buffer_Y = -4;
		
var bullet = instance_create_layer(x + direction_Padding_X , y -6, "Bullet", oBullet);
bullet.image_xscale = scale;
bullet.direction = direction_ + random_range (-1,1);
bullet.speed = 25;
	}


}
