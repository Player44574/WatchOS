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
	
	var hours = str(real_hour).pad_zeros(2)
	var minutes = str(real_min).pad_zeros(2)
	
	text = "[center]" + hours + ":" + minutes + "[/center]"
