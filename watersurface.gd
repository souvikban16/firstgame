#watersurface

extends Node2D

func _physics_process(delta):
	var bodies=$water.get_overlapping_bodies()
	for body in bodies:
		if body.name=="player":
			global.lives-=1
			get_tree().reload_current_scene()
