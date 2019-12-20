extends Control
signal _playdied
var sent=false
func _ready():
	visible=false
func _physics_process(delta):
	if global.lives<1:
		visible=true
		get_tree().paused=true
		if sent==false:
			emit_signal("_playdied")



func _on_retry_pressed():
	global.lives=3
	global.points=0
	visible=false
	global.leveldone=false
	get_tree().paused=false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


func _on_death__playdied():
	sent=true
	print("shouldPlay")
	$died.play()
