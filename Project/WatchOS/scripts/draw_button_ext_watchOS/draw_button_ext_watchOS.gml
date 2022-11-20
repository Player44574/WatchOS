// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_button_ext_watchOS(_x, _y, _text, _width, _height){
	if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_width,_y+_height){
		draw_set_color(c_dkgrey)
		draw_rectangle(_x,_y,_x+_width,_y+_height,false)
	}
	draw_set_color(c_white)
	draw_rectangle(_x,_y,_x+_width,_y+_height,true)
	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_text_transformed(_x+_width/2,_y+_height/2+2,_text,0.4,0.4,0)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}