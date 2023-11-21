extends CharacterBody2D
const SPEED = 200

func _ready():
	velocity.x = 0 #SPEED/2
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	var y_direction = Input.get_axis("move_up","move_down")
	var x_direction = Input.get_axis("move_left","move_right")
	velocity.y = y_direction * SPEED
	velocity.x = x_direction * SPEED
	move_and_slide()
	
	if x_direction != 0 || y_direction != 0:
		$AnimatedSprite2D.play("idle", 5)
	else:
		$AnimatedSprite2D.play("idle")
