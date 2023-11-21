extends RigidBody2D
signal eaten(score_value)
@export var score_value: int = 1 

# Called when the node enters the scene tree for the first time.
func _ready():
	var krills = ["krill-1", "krill", "krill-2", "krill-3"]
	$Sprite2D.texture = load("res://assets/Characters/" + krills[randi_range(0,3)] + ".png")
	var velocity = Vector2(randf_range(-150.0, -250.0), 0.0)
	self.linear_velocity = velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.get_name() == "Player":
		eaten.emit(score_value)
	queue_free() 
