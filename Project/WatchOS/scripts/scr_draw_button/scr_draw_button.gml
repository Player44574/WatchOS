// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_button(x,y,width,height,buttonColor,text,icon,iconImgIndex,ha,va,textColor,textScale){
    if point_in_rectangle(mouse_x,mouse_y,x,y,x+width,y+height) and mouse_check_button(mb_any){pressed=1;}
    else if point_in_rectangle(mouse_x,mouse_y,x,y,x+width,y+height) and mouse_check_button_released(mb_any){pressed=2; mouse_clear(mb_any)}
	else{pressed=0;}
	
	draw_set_alpha(0.5)
	draw_roundrect_color_ext(x+3,y+3,x+width+3,y+height+3,16,16,c_white,c_black,false)
	draw_set_alpha(1)
    draw_roundrect_color_ext(x,y,x+width,y+height,16,16,buttonColor,buttonColor,false)
	draw_set_alpha(0.25)
    if pressed=1{draw_roundrect_color_ext(x,y,x+width,y+height,16,16,c_black,c_black,false)}
    draw_set_alpha(1)
	
    if ha = 0{textX=4; draw_set_halign(fa_left);}
    else if ha = 1{textX=width/2+2; draw_set_halign(fa_center);}
    else if ha = 2{textX=width-4; draw_set_halign(fa_right);}
    
    if va = 0{textY=2; draw_set_valign(fa_top);}
    else if va = 1{textY=height/2+2; draw_set_valign(fa_center);}
    else if va = 2{textY=height-2; draw_set_valign(fa_bottom);}
    
    if text!=noone and text!=false{
   	 	draw_set_color(textColor);
   	 	draw_text_transformed(x+textX,y+textY,text,textScale,textScale,0);
    
   	 	draw_set_color(c_white);
   	 	draw_set_halign(fa_left);
   	 	draw_set_valign(fa_top); 
    }
    
    if icon!=noone and icon!=false{
  	  draw_sprite(icon,iconImgIndex,x+textX-sprite_get_xoffset(icon),y+textY-sprite_get_yoffset(icon));
    }
    
    return pressed;
}