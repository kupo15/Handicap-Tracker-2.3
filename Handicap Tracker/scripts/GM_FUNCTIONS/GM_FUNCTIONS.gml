
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

function trace() {
/// @param value

var _string = "";

for(var i=0;i<argument_count;i++)
_string += string(argument[i]);

show_debug_message(_string);	
}

function concat() {
/// @param value

var _string = "";

for(var i=0;i<argument_count;i++)
_string += string(argument[i]);

return _string;
}
	
function pick(val1,val2,condition) {
/// val1 if false
/// val2 if true

if condition
return val2;
else
return val1;
	
}