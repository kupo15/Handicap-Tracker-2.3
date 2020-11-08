
function ref_set(ref,value) {

variable_instance_set(ref[0],ref[1],value);
}

function ref_get(ref) {
/// ref_get(ref)->value
/// @param ref
/// @return value

return variable_instance_get(ref[0],ref[1]);
}

function if_undef(val,invalid) {
/// @param value
/// @param invalid_return

if val == undefined
return invalid;
else
return val;

}

function draw_line_pixel(xx,yy,ww,hh,col,alpha) {
/// @param xx
/// @param yy
/// @param length
/// @param width
/// @param col
/// @param alpha

draw_sprite_ext(spr_pixel,0,xx,yy,ww,hh,0,col,alpha);
}
	
function funct_mouse_wheel(scale) {
/// @param multiplier

return (mouse_wheel_up()-mouse_wheel_down())*scale;

}
