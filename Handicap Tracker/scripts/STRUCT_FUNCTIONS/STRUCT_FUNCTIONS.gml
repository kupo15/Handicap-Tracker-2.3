function struct_copy(_source) {
	
if (is_struct(_source)) 
	{
    // create a copy of a struct, with all nested structs/arrays also copied
    var _keys = variable_struct_get_names(_source);
    var _length = array_length(_keys);
    var _result = {};
    for (var i = 0; i < _length; i++) 
		{
        var _value = struct_copy(variable_struct_get(_source, _keys[i]));
        variable_struct_set(_result, _keys[i], _value);
		}
	
    return _result;
	} 
else if (is_array(_source)) 
	{
    // create a copy of an array, with all nested structs/arrays also copied
    var _length = array_length(_source);
    var _result = array_create(_length);
    for (var i = 0; i < _length; i++) 
		{
        _result[i] = struct_copy(_source[i]);
		}
return _result;
} 
else 
	{
    // if not a struct or an array, just return the simple value
    return _source;
	}
}