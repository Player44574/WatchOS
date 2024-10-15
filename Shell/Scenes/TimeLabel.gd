extends RichTextLabel

func _ready():
	# Actualiza la hora al iniciar
	update_time()
	# Configura un temporizador para actualizar cada minuto
	var timer = $"../Timer"
	timer.wait_time = 2.0

func _on_timer_timeout():
	update_time()

func update_time():
	var real_hour = Time.get_datetime_dict_from_system().hour
	var real_min = Time.get_datetime_dict_from_system().minute
	
	var real_day = Time.get_datetime_dict_from_system().day
	var real_month = Time.get_datetime_dict_from_system().month
	var real_year = Time.get_datetime_dict_from_system().year
	
	var hours = str(real_hour).pad_zeros(2)
	var minutes = str(real_min).pad_zeros(2)
	
	var day = str(real_day).pad_zeros(2)
	var month = str(real_month).pad_zeros(2)
	var year = str(real_year)
	
	text = "[right]" + hours + ":" + minutes + "[/right]" + "[right]" + day + "/" + month + "/" + year + "[/right]"
