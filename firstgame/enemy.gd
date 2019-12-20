extends KinematicBody2D
var motion=Vector2()
var up=Vector2(0,-1)
var gravity=20
var speed=75
var pinkydead=preload("res://sprites/pinky/pinky_dead.png")
export(String,FILE,"*.tscn") var currentscene

func _physics_process(delta):
		
	motion.y +=gravity
	motion.x=-speed
	motion=move_and_slide(motion,up)
#	var bodies=$Sprite/headbox.get_overlapping_bodies()
#	for body in bodies:
#		if body.name=="player":
#			global.points+=1
#			$dead.play()

#
#	bodies=$Sprite/bodybox.get_overlapping_bodies()
#	for body in bodies:
#		if body.name=="player":
#			global.lives-=1
#			print(global.lives)
#			get_tree().change_scene(currentscene)





func _on_dead_finished():
	global.points+=1
	queue_free()


func _on_headbox_body_entered(body):
		if body.name=="player":
			$dead.play()
			$Sprite.set_texture(pinkydead)



func _on_bodybox_body_entered(body):
		if body.name=="player":
			global.lives-=1
			global.points=0
			get_tree().reload_current_scene()
			print(global.lives)




