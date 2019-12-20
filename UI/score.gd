extends Label

func _physics_process(delta):
	set_text("Final Points "+String(global.points))
	