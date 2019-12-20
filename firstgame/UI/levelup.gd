extends Control
signal playwin
var sent=false
func _ready():
	visible=false
func _physics_process(delta):
	if global.leveldone==true:
		visible=true
		get_tree().paused=true
		if sent==false:
			emit_signal("playwin")
		



func _on_replay_pressed():
	global.lives=3
	global.points=0
	global.leveldone=false
	get_tree().paused=false
	visible=false
	print("Hey I'm Souvik. Thanks for trying out my game. Please reach out with criticims")
	get_tree().change_scene("res://UI/Menu.tscn")
	


func _on_quit_pressed():
	print("Hey I'm Souvik. Thanks for trying out my game. Please reach out with criticims")
	get_tree().quit()

func _on_levelup_playwin():
	sent=true
	print("playwin")
	$victory.play()