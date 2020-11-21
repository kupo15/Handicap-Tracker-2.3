draw_set_font(fn_normal);
draw_set_color(c_black);

debug_submenu_names();
ini_config();
ini_shared();

json_data_load();
ini_create();

/*
exit;
test_arr = [];

scr_course_create("name",test_arr)
scr_course_add_tee("","blue","0","0","0","0");

course_index = 0;
original_struct = test_arr[course_index];
working_struct = struct_copy(original_struct); // details screen
sm(working_struct);

// enter tee data screen
active_struct = struct_undo_push(working_struct,working_struct.subcourses[0],"blue");
sm(active_struct)

// change tee value
active_struct.coursePar = "CHANGE";
sm(working_struct);

// back out
active_struct = struct_undo_pop(working_struct,original_struct);
sm(working_struct)

// enter tee data screen
active_struct = struct_undo_push(working_struct,working_struct.subcourses[0],"blue");
sm(active_struct)

// change tee value
active_struct.coursePar = "YESSS";
sm(working_struct)

// save 
active_struct = struct_undo_pop(working_struct,original_struct,true);
sm(working_struct)

// save all
test_arr[course_index] = working_struct;
active_struct = undefined;
working_struct = undefined;

sm(original_struct)
sm(test_arr[course_index])






