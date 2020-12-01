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

help_info,
settings,
enumcount,

edit_score,
score_create,
score_view,
score_details,

score_card_details,

profile,

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
locationYoff,
roundtypeYoff,
entryYoff,

sidebarXoff,

scoreSortUnderline,
courseSortUnderline,

scorelistOffset,
courselistOffset,
seasonOffset,
statsOffset,
indexOffset,

enumcount,
}

enum score_sort {
currentYear,
lastYear,
allScores
}

enum course_sort {
abc,
frequency,
favorite
}

enum round_Type {
practice,
casual,
tournament	
}

enum highlightAction {
courseSelect,	
navbarSwitch
}

enum profile_data {
name	
	
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

enum textboxEntry {
	
popupEntryText,
}

enum navbar {
main = -2,
hidden = -1,

profileChange,
sidebar,

coursebar,
locationbar,
teebar,
year_select,
parbar,
roundtype,
scorebar,
numpad,
popupEntry,
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

