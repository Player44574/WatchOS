extends VBoxContainer

func _process(delta):
	var spacing = size.y * 48 / 688
	add_theme_constant_override("separation",spacing)
