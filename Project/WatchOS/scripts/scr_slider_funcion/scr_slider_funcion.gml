// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slider_funcion(x,y,min,max,length,leftColor,rightColor,sliderColor){    
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+length,y+4) and mouse_check_button(mb_any){
		if mouse_x>=x and mouse_x<=x+length{sliderPosition=mouse_x-x;}
	}
    
	draw_set_color(rightColor);
	draw_rectangle(x,y,x+length,y+4,false);
	
	draw_set_color(leftColor);
	draw_rectangle(x,y,x+sliderPosition,y+4,false);
	
	draw_set_color(sliderColor);
	draw_rectangle(x+sliderPosition-2,y-4,x+sliderPosition+2,y+8,false);
    
	value=sliderPosition*max/length
	
	return value;
}