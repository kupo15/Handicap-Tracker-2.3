function scr_json_version_transition(version) {

switch version
	{
	case undefined: json_conversion_missing(); break;
	}
	
}

function json_conversion_missing() {

root_data_create();	
scr_profile_set(0);

db("file missing > root data create");
}