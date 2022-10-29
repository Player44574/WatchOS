// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_top_bar_ui(action){
	cw=camera_get_view_width(view_camera[0])
	ch=camera_get_view_height(view_camera[0])

	//Time
	if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
	if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}
	
	//draw interface
	draw_set_font(font)
	draw_set_color(color)
	draw_set_alpha(alpha)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_rectangle(0,0,256,28,false)
	draw_set_color(c_white)
	draw_text_transformed(cw/2,0,string(hour) + ":" + string(minute),0.5,0.5,0);
	draw_sprite(spr_back_icon,0,0,-10);
	
	//logic
	if point_in_rectangle(mouse_x,mouse_y,0,0,0+48,28){
		if mouse_check_button_released(mb_any){
			if action=0{room_goto(rm_apps)}
			if action=2{room_goto(rm_main)}
		}
	}
}