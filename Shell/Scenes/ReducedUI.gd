extends Control

var show = 0
var start_y = -96.0
var end_y = 16.0
var pos_y = -96.0

func _process(delta):
	if Input.is_action_just_pressed("ui_home") and show == 0:
		get_tree().root.mode = Window.MODE_FULLSCREEN
		show=1
	elif Input.is_action_just_pressed("ui_home") and show==1:
		get_tree().root.mode = Window.MODE_MINIMIZED
		show=0
	
	if show==1:
		pos_y = lerp(pos_y, end_y, 0.2)
		$BottomBar.position.y = pos_y
	else:
		pos_y = lerp(pos_y, start_y, 0.2)
		$BottomBar.position.y = pos_y
