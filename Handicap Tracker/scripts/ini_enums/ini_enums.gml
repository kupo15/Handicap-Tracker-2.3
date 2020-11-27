function enumGOTO() {}
ini_screen_changeGOTO();

enum screen {
home,
stats,
playing,
score_list,
course_list,
score_card,
indexTrend,
handicapSeason,
blank8,

help_info,
settings,
enumcount,

edit_score,
score_create,
score_view,
score_details,

playing_score_enter,

add_course,
edit_course,

edit_tees,
edit_date,
}

enum offsetScroll {
navbarYoff,
numpadYoff,
coursebarYoff,
teebarYoff,

enumcount,
	
}

enum course_sort {
abc,
frequency,
favorite
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
score_,
strokes,

tee,

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

