extends CharacterBody2D


const SPEED = 300

func _ready():
	velocity.x = 0 #SPEED/2
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	var direction = Input.get_axis("move_up","move_down")
	move_and_collide(Vector2(0, direction * SPEED * delta))
	print(delta)
