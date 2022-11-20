// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_button_watchOS(_y, _text){
	if point_in_rectangle(mouse_x,mouse_y,0,_y,global.cw,_y+32){
		draw_set_color(c_dkgrey)
		draw_rectangle(0,_y+1,global.cw,_y+32,false)
	}
	draw_set_color(c_white)
	draw_line(0,_y,global.cw,_y)
	draw_line(0,_y+32,global.cw,_y+32)
	draw_set_valign(fa_center)
	draw_set_halign(fa_left)
	draw_text_transformed(4,_y+18,_text,0.4,0.4,0)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}