// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_dial(x,y,variable,min,max,loopvar){
	var dialx = x
	var dialy = y
	var uservariable = variable
	var minx = min
	var madialx = max
	var loop = loopvar

	if loop=true{
		if uservariable = madialx+1{uservariable=minx}
		if uservariable = minx-1{uservariable=madialx}
	}else if loop=false{
		uservariable = clamp(uservariable,minx,madialx)
	}

	draw_sprite(spr_arrow,0,dialx,dialy)

	if point_in_rectangle(mouse_x,mouse_y,dialx,dialy,dialx+sprite_get_width(spr_arrow),dialy+sprite_get_height(spr_arrow)) and mouse_check_button_pressed(mb_any){
		uservariable++
	}

	draw_set_font(fn_font1)
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_text(dialx+16,dialy+sprite_get_height(spr_arrow)-4,uservariable)
	draw_set_halign(fa_left)

	draw_sprite_ext(spr_arrow,1,dialx,dialy+sprite_get_height(spr_arrow)+76,1,-1,0,c_white,1)

	if point_in_rectangle(mouse_x,mouse_y,dialx,dialy+76,dialx+sprite_get_width(spr_arrow),dialy+sprite_get_height(spr_arrow)+76) and mouse_check_button_pressed(mb_any){
		uservariable--
	}
	return uservariable
}