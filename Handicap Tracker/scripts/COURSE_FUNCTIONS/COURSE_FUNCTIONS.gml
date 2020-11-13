function scr_course_update(ind) {
	
course_edit_name = active_expense.receiptList[ind].description;
course_edit_yardage = active_expense.receiptList[ind].price;
course_edit_slope = active_expense.receiptList[ind].currency;
course_edit_rating = ind;
//course_edit_par = 

course_index = ind;

screen_change(screen.receiptUpdate);
click_textbox_set(receipt_price,0,kbv_type_numbers);	
	

}

function scr_course_details_update() {
	
// set variables	
active_course.courseName = course_edit_name;	
	
// reset variables
course_edit_name = "";

course_index = undefined;
active_course = undefined;
}

function scr_course_details_tee_update() {
	
// set variables	
active_tee.courseYardage = course_edit_yardage;
active_tee.courseSlope = course_edit_slope;
active_tee.courseRating = course_edit_rating;
active_tee.coursePar = course_edit_par;
	
// reset variables
course_edit_yardage = "";
course_edit_slope = "";
course_edit_rating = "";
course_edit_par = "";

active_tee = undefined;
}