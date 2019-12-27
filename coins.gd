#coins
extends Node
#func _physics_process(delta):
#	var bodies=$Area2D.get_overlapping_bodies()
#	for body in bodies:
#		if body.name=="player":
#
#			$ching.play()
func _ready():
	$Area2D/AnimatedSprite.play("default")
#

func _on_ching_finished():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name=="player":
		global.points+=1
		$Area2D/AnimatedSprite.play("vanished")
		$ching.play()