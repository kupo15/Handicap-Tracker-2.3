/// @param kvtype_var
/// @param [kvtypereturn_var]
function vk_initiate(kvtype,kvreturn) {

	// [optional argument]
	if is_undefined(kvreturn)
	kvreturn = kbv_returnkey_next;

	keyboard_virtual_show(kvtype,kvreturn,kbv_autocapitalize_words,false); // show keyboard
	kv_active = true;
	cursorSet = true;
}

