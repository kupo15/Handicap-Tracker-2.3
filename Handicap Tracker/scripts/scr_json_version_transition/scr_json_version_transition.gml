function scr_json_version_transition(version) {

switch version
	{
	default: json_conversion_missing(); break;
	}
	
}

function json_conversion_missing() {

debug_reset = true;
//root_data_create();	
//scr_profile_set(0);

db("file missing > root data create");
}