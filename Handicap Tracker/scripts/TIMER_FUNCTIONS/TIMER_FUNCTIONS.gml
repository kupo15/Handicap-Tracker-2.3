
function ini_timers(){

for(var i=0;i<100;i++)
timer[i] = -1;
}

function scr_timers() {
	
for(var i=0;i<100;i++)
	{
	// skip timers from counting down
	switch i 
		{
		case 0:
		case 1:
		case 2: continue;
		}
	
	
	if timer[i] > -1
	timer[i] --;
	}
	
if abs(mouse_ydist) > 5
timer[timer_index.press_hold] = -1;
	
scr_timer_beep();
}