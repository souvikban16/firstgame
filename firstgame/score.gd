extends Label
func _physics_process(delta):process(delta):
	set_text("Your Points="+String(global.points))
