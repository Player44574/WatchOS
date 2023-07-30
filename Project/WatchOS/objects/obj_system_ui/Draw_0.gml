if global.theme="light"{
	setUpBlue=make_color_rgb(178,218,250)
	foregroundColor=make_color_rgb(222, 222, 222)
	backgroundColor=c_white
	textcolor=c_black
}
else{
	setUpBlue=make_color_rgb(99, 150, 216)
	foregroundColor=make_color_rgb(40, 46, 51)
	backgroundColor=make_color_rgb(16, 18, 4)
	textcolor=c_white
}

if draw=0{
	//draw taskbar
	draw_roundrect_color_ext(-1,global.ch-40,global.cw-1,global.ch+40,16,16,foregroundColor,foregroundColor,false)

	//draw app icon
	draw_set_alpha(1)
	draw_circle(20,global.ch-20,16,false)
	draw_set_color(foregroundColor)
	draw_set_alpha(1)
	draw_circle(20,global.ch-20,13,false)
	draw_set_color(c_white)

	//draw taskview 

	//draw time
	if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
	if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}
	if current_day<10{day="0" + string(current_day)}else{day=current_day}
	if current_month<10{month="0" + string(current_month)}else{month=current_month}
	if current_year<10{year="0" + string(current_year)}else{year=current_year}
	date=string(day)+"/"+string(month)+"/"+string(year)
	draw_set_halign(fa_right)
	draw_set_valign(fa_center)
	draw_text_transformed(global.cw-8,global.ch-18,string(hour)+":"+string(minute)+"\n"+string(date),0.25,0.25,0)

	draw_reset();
}