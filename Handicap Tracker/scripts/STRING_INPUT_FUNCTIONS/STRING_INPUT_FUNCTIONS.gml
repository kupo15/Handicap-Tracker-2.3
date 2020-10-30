
/// @description converts strings to real number
function string_convert_real(str,limit) {

	var str_cull = string_digits(str); // string with non digits culled
	var str_ll = string_length(str_cull); // length of string

	if str_cull != str // if culled
	keyboard_string = str_cull;

	if str_ll > limit // if more than the limit
		{
		str = string_delete(str_cull,limit+1,1); // remove extra digits
		keyboard_string = str;
		}
	else str = str_cull;

	if cursorPos < textboxStringLength // if cursor is in the middle
		 {
		 if kv_input_backspace // if deleting a character
			{
			str = string_delete(kv_last_string,cursorPos,1); // delete character from previous string
			keyboard_string = str; // update keyboard string
			}
		 else if (kv_last_string != keyboard_string) // if adding a character
			{
			var last_char = string_char_at(str,str_ll); // get last character
			str = string_delete(str,str_ll,1); // delete last letter

			str = string_insert(last_char,str,cursorPos+1); // insert at cursor pos
			keyboard_string = str;
			}
		 }

	if os_type == os_android
	if string_length(kv_last_string) == 1 && kv_input_backspace
		{
		keyboard_string = "";
		str = "";
		}

	return str;


}

/// @description capitalizes the first character in a string
function string_capitalize(str,str_limit) {

#region capitalize
	/*var str_1 = string_char_at(str_,1); // get the first character
	str_1 = string_upper(str_1); // upper case character

	str_ = string_delete(str_,1,1); // delete first character
	str_ = string_insert(str_1,str_,1); // insert capital character*/
#endregion

	var str_ll = string_length(str);
	if str_limit != -1 && str_ll > 0 && (str_ll > str_limit) // if more than the limit
		{
		str = string_delete(str,str_limit+1,1); // remove extra digits
		keyboard_string = str;
		}
	else if cursorPos < textboxStringLength // if cursor is in the middle
		 {
		 if kv_input_backspace // if deleting a character
			{
			str = string_delete(kv_last_string,cursorPos,1); // delete character from previous string
			keyboard_string = str; // update keyboard string
			}
		 else if (kv_last_string != keyboard_string) // if adding a character
			{
			var last_char = string_char_at(str,str_ll); // get last character
			str = string_delete(str,str_ll,1); // delete last letter

			str = string_insert(last_char,str,cursorPos+1); // insert at cursor pos
			keyboard_string = str;
			}
		 }

	// Override Auto capital
	if os_type == os_android
	if string_length(kv_last_string) == 1 && kv_input_backspace
		{
		keyboard_string = "";
		str = "";
		}

	return str;


}

/// @description converts strings to currency format
function string_convert_rating(str,limit) {

	var decimal_places = 0; // one tenth place

	var str_cull = string_digits(str); // string with non digits culled
	var str_ll = string_length(str_cull); // length of string

	// remove 0s in front
	repeat (2)
		{
		if string_char_at(str_cull,1) == "0"
		str_cull = string_delete(str_cull,1,1);
		}

	if str_cull != str // if culled
	keyboard_string = str_cull;

	if str_ll > limit // if more than the limit
		{
		str = string_delete(str_cull,limit+1,1); // remove extra digits
		keyboard_string = str;
		}
	else str = str_cull;

	str = string(str); // convert back to a string

	// add a decimal point
	if str != ""
		{
		str_ll = string_length(str); // get the length of the string
	
		var str_ins = ".";
	
		// decimal insert
		if str_ll == 2
		str += ".";
		else if str_ll > 2
		str = string_insert(str_ins,str,str_ll-decimal_places); // insert a decimal only
		}
	
	if string_length(kv_last_string) == 1 && kv_input_backspace
		{
		keyboard_string = "";
		str = "";
		}

	return str;


}

function string_convert_upper(str) {

var upper = true;
var str_ll = string_length(str);
for(var i=1;i<str_ll+1;i++)
	{
	var char = string_char_at(str,i); // character to replace

	if upper
		{
		upper = false;
		var char = string_upper(char); // uppercase character
		str = string_delete(str,i,1); // delete character
		str = string_insert(char,str,i); // insert the capital version
		}
	else if char == " "
	upper = true;
	}
	
	return str;
}
	
	/// @description  scr_input_text(limit);
function scr_input_text(limit) {

	var str = keyboard_string;

	if limit != -1 && string_length(str) > limit
	    {
	    str = string_delete(str,limit+1,1);
	    keyboard_string = str;
	    }
    
	return str;



}
