extends KinematicBody2D

var motion=Vector2()
var up=Vector2(0,-1)
var gravity=20
var speed=200
var jump_height=400

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("left"):
		$anim.flip_h=true
		motion.x=-speed
		$anim.play("run")
	elif Input.is_action_pressed("right"):
		$anim.flip_h=false
		$anim.play("run")
		motion.x=speed
	else:
		motion.x=0
		$anim.play("idle")
	if is_on_floor()==true:
		if Input.is_action_just_pressed("jump"):
			motion.y=-jump_height
			$jump.play()
	else:
		if motion.y<0:
			$anim.play("jump")
		else:
			$anim.play("fall")
	motion=move_and_slide(motion,up)
	
			
