
// draw 3 bar icon
function draw_menu_bars(xx,yy,ww,hh,sep,col) {

	for(var i=0;i<3;i++)
	draw_line_width_color(xx,yy+(i*(sep+hh)),xx+ww,yy+(i*(sep+hh)),hh,col,col);

}

function draw_menu_xout(xx,yy,ww,hh,thick,col) {

draw_line_width_color(xx,yy,xx+ww,yy+hh,thick,col,col); // line top left to bottom right
draw_line_width_color(xx,yy+hh,xx+ww,yy,thick,col,col); // line bot left to top right
}