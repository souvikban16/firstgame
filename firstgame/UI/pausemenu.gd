extends Control

func _ready():
	visible=false
	
func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state=not get_tree().paused
		get_tree().paused= new_pause_state
		visible=new_pause_state


func _on_resume_pressed():
	visible=false
	get_tree().paused=false


func _on_restart_level_pressed():
	get_tree().paused=false
	global.lives=3
	global.points=0
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()