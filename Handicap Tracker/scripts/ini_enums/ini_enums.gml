function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
home,
stats,
playing,
score_list,
course_list,
score_card,
index,
blank7,
blank8,

help_info,
settings,
enumcount,

add_score,
edit_score,

add_course,
edit_course,

edit_tees,
edit_date,
}

enum highlightAction {
courseSelect,	
navbarSwitch
}

enum course_data {
name,
yardage,
slope,
rating,
par,

enumcount
}

enum score_data {
course,
tee,
yardage,
slope,
rating,
par,
score_,
date,
strokes,
course_handicap,
index,
esr
}

enum tee_data {
yardage,
slope,
rating,
par
}



enum navbar {
sidebar = -5,
main = -4,
hidden = -1,

coursebar,
teebar,
year_select,
parbar,
scorebar,
numpad,
calendar,
calendarYearSelect
}

enum tee_marker {
green,
red,
white,
blue,
gold,
black
}

