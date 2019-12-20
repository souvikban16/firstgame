extends Label

func _physics_process(delta):
	set_text("Points  "+String(global.points))
