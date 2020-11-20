draw_set_font(fn_normal);
draw_set_color(c_black);

debug_submenu_names();
ini_config();
ini_shared();

json_data_load();
ini_create();


/*
test_arr = [];

scr_course_create("name",test_arr)
scr_course_add_tee("","blue","0","0","0","0");

course_index = 0;
course_struct = test_arr[course_index];
active_course = struct_copy(course_struct);

// change value
active_course.courseName = "change";


tee_struct = variable_struct_get(active_course.subcourses[0],"blue");
active_tee = struct_copy(tee_struct);

active_tee.coursePar = 10;


sm(tee_struct)

tee_struct = active_tee
sm(tee_struct)

sm(active_course)


