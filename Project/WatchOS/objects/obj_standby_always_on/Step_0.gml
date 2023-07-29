//Time
if current_hour<10{hour="0" + string(current_hour)}else{hour=current_hour}
if current_minute<10{minute="0" + string(current_minute)}else{minute=current_minute}

//date
if current_day<10{day="0" + string(current_day)}else{day=current_day}
if current_month<10{month="0" + string(current_month)}else{month=current_month}
if current_year<10{year="0" + string(current_year)}else{year=current_year}

//weekday
if current_weekday=0{if global.languaje="en"{wkday="Sunday"}else if global.languaje="es"{wkday="Domingo"}}
if current_weekday=1{if global.languaje="en"{wkday="Monday"}else if global.languaje="es"{wkday="Lunes"}}
if current_weekday=2{if global.languaje="en"{wkday="Tuesday"}else if global.languaje="es"{wkday="Martes"}}
if current_weekday=3{if global.languaje="en"{wkday="Wednesday"}else if global.languaje="es"{wkday="Miércoles"}}
if current_weekday=4{if global.languaje="en"{wkday="Thursday"}else if global.languaje="es"{wkday="Jueves"}}
if current_weekday=5{if global.languaje="en"{wkday="Friday"}else if global.languaje="es"{wkday="Viernes"}}
if current_weekday=6{if global.languaje="en"{wkday="Saturday"}else if global.languaje="es"{wkday="Sábado"}}

//destroy when awake
if global.watchInactive=true and mouse_check_button_released(mb_any){instance_destroy()}