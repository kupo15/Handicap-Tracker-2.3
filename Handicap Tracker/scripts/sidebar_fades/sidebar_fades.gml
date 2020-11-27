function sidebar_fades() {
var fade_spd = 0.14;
	
offsetArray[offsetScroll.navbarYoff] = (submenu != navbar.main); // ? navbar_yoff = false : navbar_yoff = true

if offsetArray[offsetScroll.navbarYoff] != offsetArrayStart[offsetScroll.navbarYoff]
offsetArrayStart[offsetScroll.navbarYoff] = lerp(offsetArrayStart[offsetScroll.navbarYoff],offsetArray[offsetScroll.navbarYoff],fade_spd);

// teebar
offsetArray[offsetScroll.teebarYoff] = (submenu == navbar.teebar); // ? teebar_yoff = true : teebar_yoff = false

if offsetArray[offsetScroll.teebarYoff] != offsetArrayStart[offsetScroll.teebarYoff]
offsetArrayStart[offsetScroll.teebarYoff] = lerp(offsetArrayStart[offsetScroll.teebarYoff],offsetArray[offsetScroll.teebarYoff],fade_spd);

// coursebar
offsetArray[offsetScroll.coursebarYoff] = (submenu != navbar.coursebar); // ? coursebar_yoff = true : coursebar_yoff = false

if offsetArray[offsetScroll.coursebarYoff] != offsetArrayStart[offsetScroll.coursebarYoff]
offsetArrayStart[offsetScroll.coursebarYoff] = lerp(offsetArrayStart[offsetScroll.coursebarYoff],offsetArray[offsetScroll.coursebarYoff],fade_spd);

// numpad
offsetArray[offsetScroll.numpadYoff] = !(submenu == navbar.numpad); // ? coursebar_yoff = true : coursebar_yoff = false

if offsetArray[offsetScroll.numpadYoff] != offsetArrayStart[offsetScroll.numpadYoff]
offsetArrayStart[offsetScroll.numpadYoff] = lerp(offsetArrayStart[offsetScroll.numpadYoff],offsetArray[offsetScroll.numpadYoff],fade_spd);

// alpha
if alpha_lerp != alpha_lerp_end
alpha_lerp = lerp(alpha_lerp,alpha_lerp_end,fade_spd);

// lerp the side menu position
var lerp_spd = SIDEBAR_LERP;

if offsetArray[offsetScroll.sidebarXoff] != offsetArrayEnd[offsetScroll.sidebarXoff]
offsetArray[offsetScroll.sidebarXoff] = lerp(offsetArray[offsetScroll.sidebarXoff],offsetArrayEnd[offsetScroll.sidebarXoff],lerp_spd);
		
// header delete
headerDeleteOffset = mode_delete;

if headerDeleteOffset != headerDeleteOffsetDisp
headerDeleteOffsetDisp = lerp(headerDeleteOffsetDisp,headerDeleteOffset,0.19);
	
}
