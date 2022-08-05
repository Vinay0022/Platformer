/// @description Insert description here
// You can write your code in this editor

var near = layer_get_id("Backgrounds_4");
var far = layer_get_id("Backgrounds_2");

layer_x(near, lerp(0,camera_get_view_x(view_camera[0]),0.5));
layer_x(far, lerp(0,camera_get_view_x(view_camera[0]),0.5)); 
