/// @param number
function round_tenth(argument0) {

	var n = argument0;

	n *= 10;
	n = round(n);
	n /= 10;

	return n;


}
