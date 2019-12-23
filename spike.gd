#spikes
extends Node2D

func _physics_process(delta):
	var bodies=$Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name=="player":
			global.points=0
			global.lives-=1
			get_tree().reload_current_scene()
		
	