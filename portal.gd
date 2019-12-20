extends Area2D




func _on_portal_body_entered(body):
	if body.name=="player":
		print("Next Level")
		global.leveldone=true