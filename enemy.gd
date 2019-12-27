extends KinematicBody2D
var motion=Vector2()
var up=Vector2(0,-1)
var gravity=20
var speed=75
var directionflag=false
var pinkydead=preload("res://sprites/pinky/pinky_dead.png")
export(String,FILE,"*.tscn") var currentscene

func _ready():
	directionflag=false
func _physics_process(delta):
		
	motion.y +=gravity
	motion.x=-speed
#	motion=move_and_slide(motion,up)
	var bodies=$Sprite/bodybox.get_overlapping_areas()
	for body in bodies:
		if body.name=="water":
			queue_free()			
	motion=move_and_slide(motion,up)
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
	print(body.name)
	if body.name=="player":
		global.lives-=1
		global.points=0
		get_tree().reload_current_scene()
		print(global.lives)





func _on_wallcheck_body_entered(body):
	print (body.name)
	if body.name=="soil":
		print(body.name)
		directionflag=not directionflag
		$Sprite.flip_h=directionflag
		speed*=-1




func _on_edgecheckleft_body_exited(body):
	if body.name=="soil":
		directionflag=not directionflag
		$Sprite.flip_h=directionflag
		speed*=-1



func _on_edgecheckright_body_exited(body):
	if body.name=="soil":
		directionflag=not directionflag
		print (directionflag)
		$Sprite.flip_h=directionflag
		speed*=-1


func _on_wallcheck_area_entered(area):
	if area.name=="wallcheck":
		directionflag=not directionflag
		print (directionflag)
		$Sprite.flip_h=directionflag
		speed*=-1
		
