extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.text = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_score(score):
	$ScoreLabel.text = str(score)
