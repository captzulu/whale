extends Node

var scroll_speed = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
		
	$Environment/ParallaxBackground.scroll_base_offset.x -= delta * scroll_speed

func _on_player_ready():
	$Player.global_position = $Environment/PlayerSpawn.global_position

