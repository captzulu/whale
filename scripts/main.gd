extends Node

var scroll_speed = 50
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport().size
	$Player/Camera2D.limit_bottom = viewport_size.y
	print($Player/Camera2D.limit_bottom)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		
	$Environment/ParallaxBackground.scroll_base_offset.x -= delta * scroll_speed
	$Environment/LeftWall.position.x += (delta * scroll_speed)
	#print($Environment/LeftWall.position)
	

func _on_player_ready():
	$Player.global_position = $Environment/PlayerSpawn.global_position

func _on_krill_timer_timeout():
	var krill = preload("res://scenes/krill.tscn").instantiate()
	var krill_spawn_point = $Environment/KrillSpawn
	
	krill.position = krill_spawn_point.position
	krill.position.y += randi_range(-85, 85)
	krill.name = "krill"
	add_child(krill)
	krill.eaten.connect(_on_food_eaten)
	
func _on_left_wall_body_entered(body):
	if body.get_name() != "Player":
		body.queue_free()

func _on_food_eaten(food_score_value):
	score += food_score_value
	$HUD.update_score(score)
