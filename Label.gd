extends Label

func _physics_process(delta):
	set_text("Lives  "+String(global.lives))
